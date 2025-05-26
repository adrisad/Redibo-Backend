-- CreateEnum
CREATE TYPE "EstadoConductor" AS ENUM ('NO_REQUESTED', 'PENDING', 'APPROVED');

-- AlterTable
ALTER TABLE "Usuario" ADD COLUMN     "estadoConductor" "EstadoConductor";
