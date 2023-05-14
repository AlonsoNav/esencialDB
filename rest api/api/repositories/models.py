from sqlalchemy import Column, ForeignKey, Integer, BIGINT, VARCHAR, BINARY, VARBINARY, TIMESTAMP, INT, DECIMAL, PrimaryKeyConstraint
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class inspectores(db.Model):
    __tablename__ = "inspectores"
    inspectorId = Column(BIGINT,primary_key=True)
    nombre = Column(VARCHAR(30))
    profilePic = Column(VARCHAR(100))
    deleted = Column(BINARY)
    apellido = Column(VARCHAR(50))

class productos(db.Model):
    __tablename__ = "productos"
    productoId = Column(INT,primary_key=True)
    enabled = Column(BINARY)
    descripcion = Column(VARCHAR(50))

class logProducciones(db.Model):
    __tablename__ = "logProducciones"
    produccionId = Column(BIGINT,primary_key=True)
    productoId = Column(INT, ForeignKey("productos.productoId"))
    cantidad = Column(BIGINT)
    inspectorId = Column(BIGINT, ForeignKey("inspectores.inspectorId"))
    accesedFrom = Column(VARCHAR(50))
    checksum = Column(VARBINARY(150))
    posttime = Column(TIMESTAMP)

class materiales(db.Model):
    __tablename__ = "materiales"
    materialId = Column(INT,primary_key=True)
    nombre = Column(VARCHAR(50))
    uniMedida = Column(VARCHAR(10))

class inventarioMateriales(db.Model):
    __tablename__ = "inventarioMateriales"
    materialId = Column(INT, ForeignKey("materiales.materialId"))
    cantidad = Column(DECIMAL(precision=18,scale=2))
    inspectorId = Column(BIGINT, ForeignKey("inspectores.inspectorId"))
    posttime = Column(TIMESTAMP)
    accesedFrom = Column(VARCHAR(50))
    checksum = Column(VARBINARY(150))
    produccionId = Column(BIGINT, ForeignKey("logProducciones.produccionId"))
    inventarioID = Column(BIGINT, primary_key=True)