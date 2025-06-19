import { PrismaClient } from '@prisma/client'
const globalForPrisma = global as unknown as { prisma: PrismaClient }
// This is a workaround to avoid creating multiple PrismaClient instances in development mode
// It ensures that the PrismaClient is only instantiated once, preventing issues with hot reloading in development
export const prisma = globalForPrisma.prisma || new PrismaClient()
// If the globalForPrisma.prisma is not defined, create a new PrismaClient instance

if (process.env.NODE_ENV !== 'production') globalForPrisma.prisma = prisma
// Assign the PrismaClient instance to globalForPrisma.prisma for future use
// This allows us to reuse the same instance across different parts of the application
