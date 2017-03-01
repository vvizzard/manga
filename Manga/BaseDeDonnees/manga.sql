/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  28/02/2017 14:58:14                      */
/*==============================================================*/


drop index PRODUIT_PK;

drop table PRODUIT;

drop index EMPLOYE_PK;

drop table EMPLOYE;

drop index CATEGORIE_PK;

drop table CATEGORIE;

drop index EMAIL_PK;

drop table EMAIL;

--drop index ASSOCIATION_2_FK;

--drop index ASSOCIATION_1_FK;

drop index MOUVEMENT_PK;

drop table MOUVEMENT;

drop index PASSWORD_PK;

drop table PASSWORD;

drop index PRIX_PK;

drop table PRIX;

--drop index ASSOCIATION_5_FK;

--drop index ASSOCIATION_4_FK;

--drop index ASSOCIATION_3_FK;


/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE (
   ID_CATEGORIE         SERIAL               not null,
   NOM_CATEGORIE        VARCHAR(20)          not null,
   constraint PK_CATEGORIE primary key (ID_CATEGORIE)
);

/*==============================================================*/
/* Index : CATEGORIE_PK                                         */
/*==============================================================*/
create unique index CATEGORIE_PK on CATEGORIE (
ID_CATEGORIE
);

/*==============================================================*/
/* Table : EMAIL                                                */
/*==============================================================*/
create table EMAIL (
   ID_EMAIL             SERIAL               not null,
   EMAIL                VARCHAR(50)          not null,
   constraint PK_EMAIL primary key (ID_EMAIL)
);

/*==============================================================*/
/* Index : EMAIL_PK                                             */
/*==============================================================*/
create unique index EMAIL_PK on EMAIL (
ID_EMAIL
);

/*==============================================================*/
/* Table : EMPLOYE                                              */
/*==============================================================*/
create table EMPLOYE (
   ID_EMPLOYE           SERIAL               not null,
   ID_EMAIL             INT4                 not null,
   ID_PASSWORD          INT4                 not null,
   NOM_EMPLOYE          VARCHAR(40)          not null,
   PRENOM_EMPLOYE       VARCHAR(20)          not null,
   SALAIRE              MONEY                not null,
   constraint PK_EMPLOYE primary key (ID_EMPLOYE)
);

/*==============================================================*/
/* Index : EMPLOYE_PK                                           */
/*==============================================================*/
create unique index EMPLOYE_PK on EMPLOYE (
ID_EMPLOYE
);

/*==============================================================*/
/* Index : ASSOCIATION_1_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_1_FK on EMPLOYE (
ID_EMAIL
);

/*==============================================================*/
/* Index : ASSOCIATION_2_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_2_FK on EMPLOYE (
ID_PASSWORD
);

/*==============================================================*/
/* Table : MOUVEMENT                                            */
/*==============================================================*/
create table MOUVEMENT (
   ID_MOUVEMENT         SERIAL               not null,
   DATE_MOUVEMENT       DATE                 not null,
   NOMBRE               INT4                 not null,
   ENTREE               INT2                 null,
   constraint PK_MOUVEMENT primary key (ID_MOUVEMENT)
);

/*==============================================================*/
/* Index : MOUVEMENT_PK                                         */
/*==============================================================*/
create unique index MOUVEMENT_PK on MOUVEMENT (
ID_MOUVEMENT
);

/*==============================================================*/
/* Table : PASSWORD                                             */
/*==============================================================*/
create table PASSWORD (
   ID_PASSWORD          SERIAL               not null,
   PASSWORD             VARCHAR(20)          not null,
   constraint PK_PASSWORD primary key (ID_PASSWORD)
);

/*==============================================================*/
/* Index : PASSWORD_PK                                          */
/*==============================================================*/
create unique index PASSWORD_PK on PASSWORD (
ID_PASSWORD
);

/*==============================================================*/
/* Table : PRIX                                                 */
/*==============================================================*/
create table PRIX (
   ID_PRIX              SERIAL               not null,
   PRIX_ENTREE          MONEY                null,
   PRIX_SORTIE          MONEY                null,
   constraint PK_PRIX primary key (ID_PRIX)
);

/*==============================================================*/
/* Index : PRIX_PK                                              */
/*==============================================================*/
create unique index PRIX_PK on PRIX (
ID_PRIX
);

/*==============================================================*/
/* Table : PRODUIT                                              */
/*==============================================================*/
create table PRODUIT (
   ID_PRODUIT           SERIAL               not null,
   ID_MOUVEMENT         INT4                 not null,
   ID_CATEGORIE         INT4                 not null,
   ID_PRIX              INT4                 not null,
   NOM_PRODUIT          VARCHAR(20)          not null,
   constraint PK_PRODUIT primary key (ID_PRODUIT)
);

/*==============================================================*/
/* Index : PRODUIT_PK                                           */
/*==============================================================*/
create unique index PRODUIT_PK on PRODUIT (
ID_PRODUIT
);

/*==============================================================*/
/* Index : ASSOCIATION_3_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_3_FK on PRODUIT (
ID_CATEGORIE
);

/*==============================================================*/
/* Index : ASSOCIATION_4_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_4_FK on PRODUIT (
ID_MOUVEMENT
);

/*==============================================================*/
/* Index : ASSOCIATION_5_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_5_FK on PRODUIT (
ID_PRIX
);

alter table EMPLOYE
   add constraint FK_EMPLOYE_ASSOCIATI_EMAIL foreign key (ID_EMAIL)
      references EMAIL (ID_EMAIL)
      on delete restrict on update restrict;

alter table EMPLOYE
   add constraint FK_EMPLOYE_ASSOCIATI_PASSWORD foreign key (ID_PASSWORD)
      references PASSWORD (ID_PASSWORD)
      on delete restrict on update restrict;

alter table PRODUIT
   add constraint FK_PRODUIT_ASSOCIATI_CATEGORI foreign key (ID_CATEGORIE)
      references CATEGORIE (ID_CATEGORIE)
      on delete restrict on update restrict;

alter table PRODUIT
   add constraint FK_PRODUIT_ASSOCIATI_MOUVEMEN foreign key (ID_MOUVEMENT)
      references MOUVEMENT (ID_MOUVEMENT)
      on delete restrict on update restrict;

alter table PRODUIT
   add constraint FK_PRODUIT_ASSOCIATI_PRIX foreign key (ID_PRIX)
      references PRIX (ID_PRIX)
      on delete restrict on update restrict;

