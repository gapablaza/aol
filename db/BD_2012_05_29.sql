/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     29/05/2012 21:36:24                          */
/*==============================================================*/


drop table if exists ESTADO;

drop table if exists HORAS;

drop table if exists PACIENTES;

drop table if exists SOLICITUD;

drop table if exists USUARIOS;

drop table if exists USUARIOS_TIPOS;

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO
(
   ESTA_ID              numeric(8,0) not null,
   SOLI_ID              numeric(8,0),
   ESTA_DESCRIPCION     varchar(30) not null,
   ESTA_ELIMINADO       bool not null,
   primary key (ESTA_ID)
);

/*==============================================================*/
/* Table: HORAS                                                 */
/*==============================================================*/
create table HORAS
(
   HORA_ID              numeric(8,0) not null,
   USUA_ID              numeric(8,0),
   HORA_INICIO          time not null,
   HORA_TERMINO         time not null,
   FECHA                date not null,
   primary key (HORA_ID)
);

/*==============================================================*/
/* Table: PACIENTES                                             */
/*==============================================================*/
create table PACIENTES
(
   PACI_ID              numeric(8,0) not null,
   PACI_RUT             numeric(8,0) not null,
   PACI_NOMBRE          varchar(50) not null,
   PACI_APEPAT          varchar(30) not null,
   PACI_APEMAT          varchar(30),
   PACI_ELIMINADO       bool,
   primary key (PACI_ID)
);

/*==============================================================*/
/* Table: SOLICITUD                                             */
/*==============================================================*/
create table SOLICITUD
(
   SOLI_ID              numeric(8,0) not null,
   PACI_ID              numeric(8,0),
   HORA_ID              numeric(8,0),
   SOLI_CODIGO          varchar(20) not null,
   SOLI_RUT_PACIENTE    numeric(8,0),
   SOLI_NOMBRE_PACIENTE varchar(50),
   SOLI_APEPAT_PACIENTE varchar(30),
   SOLI_APEMAT_PACIENTE varchar(30),
   SOLI_EMAIL           varchar(50),
   primary key (SOLI_ID)
);

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS
(
   USUA_ID              numeric(8,0) not null,
   USTI_ID              numeric(8,0),
   USUA_RUT             numeric(8,0) not null,
   USUA_NOMBRE          varchar(50) not null,
   USUA_APEPAT          varchar(30) not null,
   USUA_APEMAT          varchar(30),
   USUA_EMAIL           varchar(50) not null,
   USUA_ELIMINADO       bool not null,
   primary key (USUA_ID)
);

/*==============================================================*/
/* Table: USUARIOS_TIPOS                                        */
/*==============================================================*/
create table USUARIOS_TIPOS
(
   USTI_ID              numeric(8,0) not null,
   USTI_DESCRIPCION     varchar(30) not null,
   primary key (USTI_ID)
);

alter table ESTADO add constraint FK_RELATIONSHIP_5 foreign key (SOLI_ID)
      references SOLICITUD (SOLI_ID) on delete restrict on update restrict;

alter table HORAS add constraint FK_RELATIONSHIP_3 foreign key (USUA_ID)
      references USUARIOS (USUA_ID) on delete restrict on update restrict;

alter table SOLICITUD add constraint FK_RELATIONSHIP_1 foreign key (PACI_ID)
      references PACIENTES (PACI_ID) on delete restrict on update restrict;

alter table SOLICITUD add constraint FK_RELATIONSHIP_2 foreign key (HORA_ID)
      references HORAS (HORA_ID) on delete restrict on update restrict;

alter table USUARIOS add constraint FK_RELATIONSHIP_4 foreign key (USTI_ID)
      references USUARIOS_TIPOS (USTI_ID) on delete restrict on update restrict;

