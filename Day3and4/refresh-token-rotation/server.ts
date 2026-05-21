import express, { Request, Response } from "express";
import jwt from "jsonwebtoken";
import crypto from "crypto";

const app = express();
app.use(express.json());


const ACCESS_SECRET = "ACCESS_SECRET";


type TokenRecord = {
  userId: number;
  revoked: boolean;
};

const refreshStore: Map<string, TokenRecord> = new Map();

function generateAccessToken(userId: number) {
  return jwt.sign(
    { userId },
    ACCESS_SECRET,
    { expiresIn: "15m" }
  );
}

function generateRefreshToken(): string {
  return crypto.randomBytes(64).toString("hex");
}


app.get("/", (req: Request, res: Response) => {
  res.json({
    message: "JWT Refresh Token Rotation API 🚀",
    routes: {
      login: "POST /login",
      refresh: "POST /refresh",
    },
  });
});


app.post("/login", (req: Request, res: Response) => {
  const userId = 1; // demo user

  const accessToken = generateAccessToken(userId);
  const refreshToken = generateRefreshToken();

  refreshStore.set(refreshToken, {
    userId,
    revoked: false,
  });

  res.json({
    accessToken,
    refreshToken,
  });
});

app.post("/refresh", (req: Request, res: Response) => {
  const { refreshToken } = req.body;

  const record = refreshStore.get(refreshToken);

  // 1. INVALID TOKEN
  if (!record) {
    return res.status(403).json({
      message: "Invalid refresh token",
    });
  }

  // 2. REUSE DETECTION (ATTACK CASE)
  if (record.revoked) {
    refreshStore.clear(); // kill all sessions

    return res.status(403).json({
      message: "Token reuse detected. All sessions revoked.",
    });
  }

  // 3. ROTATE TOKEN (invalidate old one)
  record.revoked = true;

  const newRefreshToken = generateRefreshToken();

  refreshStore.set(newRefreshToken, {
    userId: record.userId,
    revoked: false,
  });

  const newAccessToken = generateAccessToken(record.userId);

  return res.json({
    accessToken: newAccessToken,
    refreshToken: newRefreshToken,
  });
});


app.listen(5000, () => {
  console.log("Server running on http://localhost:5000");
});