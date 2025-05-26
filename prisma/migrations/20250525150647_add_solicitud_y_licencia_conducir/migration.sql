-- CreateEnum
CREATE TYPE "EstadoLicencia" AS ENUM ('ACTIVA', 'VENCIDA', 'SUSPENDIDA');

-- CreateEnum
CREATE TYPE "EstadoSolicitud" AS ENUM ('PENDIENTE', 'APROBADA', 'RECHAZADA');

-- CreateEnum
CREATE TYPE "CategoriaLicencia" AS ENUM ('M', 'P', 'A', 'B', 'C', 'T');

-- CreateTable
CREATE TABLE "SolicitudConductor" (
    "id" SERIAL NOT NULL,
    "usuarioId" INTEGER NOT NULL,
    "front" TEXT NOT NULL,
    "back" TEXT NOT NULL,
    "estado" "EstadoSolicitud" NOT NULL DEFAULT 'PENDIENTE',
    "categoria" "CategoriaLicencia" NOT NULL,
    "numeroLicencia" TEXT NOT NULL,
    "fechaEmision" TIMESTAMP(3) NOT NULL,
    "fechaVencimiento" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SolicitudConductor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LicenciaConducir" (
    "id" SERIAL NOT NULL,
    "usuarioId" INTEGER NOT NULL,
    "numeroLicencia" TEXT NOT NULL,
    "fechaEmision" TIMESTAMP(3) NOT NULL,
    "fechaVencimiento" TIMESTAMP(3) NOT NULL,
    "categoria" "CategoriaLicencia" NOT NULL,
    "estado" "EstadoLicencia" NOT NULL DEFAULT 'ACTIVA',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LicenciaConducir_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "SolicitudConductor" ADD CONSTRAINT "SolicitudConductor_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LicenciaConducir" ADD CONSTRAINT "LicenciaConducir_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
