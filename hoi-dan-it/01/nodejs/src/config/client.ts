import { PrismaClient } from '@prisma/client'
import 'dotenv/config'
const globalForPrisma = global as unknown as { prisma: PrismaClient }
// This is a workaround to avoid creating multiple PrismaClient instances in development mode
// It ensures that the PrismaClient is only instantiated once, preventing issues with hot reloading in development
export const prisma = globalForPrisma.prisma || new PrismaClient(
      {
            log: process.env.NODE_ENV === 'development' ? ['query', 'info', 'warn', 'error'] : ['error'],
      }// This sets the logging level for PrismaClient based on the environment 
      // In development, it logs queries, info, warnings, and errors
      // In production, it only logs errors
)
// If the globalForPrisma.prisma is not defined, create a new PrismaClient instance

if (process.env.NODE_ENV !== 'production') globalForPrisma.prisma = prisma
// Assign the PrismaClient instance to globalForPrisma.prisma for future use
// This allows us to reuse the same instance across different parts of the application
