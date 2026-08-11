CREATE TABLE drug(
     drugid SERIAL NOT NULL,
    drugname varchar(100) NOT NULL,
    branded boolean NOT NULL,
    patentexpirationdate date ,
    PRIMARY KEY(drugid) 
);

CREATE TABLE drugformulation(
     drugid integer NOT NULL,
    dosageform varchar(30) NOT NULL,
    strength varchar(20) NOT NULL ,
    PRIMARY KEY(drugid,dosageform,strength) ,
    CONSTRAINT drugformulation_drugid_fkey FOREIGN key(drugid) REFERENCES drug(drugid) 
);

CREATE TABLE countries(
     countryid SERIAL NOT NULL,
    name varchar(100) NOT NULL,
    region varchar(100) ,
    PRIMARY KEY(countryid) 
);


CREATE TABLE costs(
     costid SERIAL NOT NULL,
    drugid integer NOT NULL,
    dosageform varchar(30) NOT NULL,
    strength varchar(20) NOT NULL,
    countryid integer NOT NULL,
    manufacturingcostperunit numeric(10,2) NOT NULL,
    shippingcostperunit numeric(10,2) NOT NULL ,
    PRIMARY KEY(costid) ,
    CONSTRAINT costs_drugid_dosageform_strength_fkey FOREIGN key(drugid,dosageform,strength) REFERENCES drugformulation(drugid,dosageform,strength),
    CONSTRAINT costs_countryid_fkey FOREIGN key(countryid) REFERENCES countries(countryid) ,
    CONSTRAINT costs_manufacturingcostperunit_check CHECK (manufacturingcostperunit >= (0)::numeric),
    CONSTRAINT costs_shippingcostperunit_check CHECK (shippingcostperunit >= (0)::numeric) 
); 
CREATE UNIQUE INDEX costs_drugid_dosageform_strength_countryid_key ON public.costs USING btree (drugid, dosageform, strength, countryid);


CREATE TABLE sales(
     saleid SERIAL NOT NULL,
    drugid integer NOT NULL,
    dosageform varchar(30) NOT NULL,
    strength varchar(20) NOT NULL,
    countryid integer NOT NULL,
    quantitysold integer NOT NULL,
    salepriceperunit numeric(10,2) NOT NULL,
    saledate date NOT NULL ,
    PRIMARY KEY(saleid) ,
    CONSTRAINT sales_drugid_dosageform_strength_fkey FOREIGN key(drugid,dosageform,strength) REFERENCES drugformulation(drugid,dosageform,strength),
    CONSTRAINT sales_countryid_fkey FOREIGN key(countryid) REFERENCES countries(countryid) ,
    CONSTRAINT sales_quantitysold_check CHECK (quantitysold > 0),
    CONSTRAINT sales_salepriceperunit_check CHECK (salepriceperunit >= (0)::numeric) 
);