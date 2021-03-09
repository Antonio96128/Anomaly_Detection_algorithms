# -*- coding: utf-8 -*-
"""
Created on Sat Feb 20 16:58:39 2021

@author: anton
"""


import lxml.etree as etree
import lxml.builder as builder
import csv

elementMaker = builder.ElementMaker()


uEntity  = elementMaker.UMF_ENTITY
dCode    = elementMaker.DSRC_CODE        # A short description of the data source.
dAction  = elementMaker.DSRC_ACTION      # The source system action that caused the record to be sent.
dAcct    = elementMaker.DSRC_ACCT        # The unique ID for the entity in the data source in the system.
dRef     = elementMaker.DSRC_REF         # In database terms, this field can be used as a foreign key to source system records.


name      = elementMaker.NAME
nType     = elementMaker.NAME_TYPE       # A classification for the different types of names. M,A
firstName = elementMaker.FIRST_NAME
lastName  = elementMaker.LAST_NAME
fullName  = elementMaker.FULL_NAME


address  = elementMaker.ADDRESS
aType    = elementMaker.ADDR_TYPE       # H,B,O
addr1    = elementMaker.ADDR1
city     = elementMaker.CITY
pCode    = elementMaker.POSTAL_CODE


number = elementMaker.NUMBER
nuType = elementMaker.NUM_TYPE          # The unique code that is used to distinguish between the different types of numbers.
nValue = elementMaker.NUM_VALUE         # The actual number value.



roles = elementMaker.SEP_ROLES
rCode = elementMaker.ROLE_CODE          #  A unique code used to assign each type of role.
rstat = elementMaker.ROLE_STAT          #  That status of the role. P,C,U


attribute = elementMaker.ATTRIBUTE
atType    = elementMaker.ATTR_TYPE      # A unique code that is used to assign each type of attribute.
atValue   = elementMaker.ATTR_VALUE



def crearUMF(cBP, cfullName):
   cfullName, cBP = cfullName.strip(), cBP.strip()
   if cBP == "": 
       cBP = "NULO"
   if cfullName == "": 
       cfullName = "NULO"

   return uEntity(
       dCode("REGLA5BENEFICIARIOSRC"),
       dAction("A"),
       dAcct(str(cBP)+ str(cfullName)),
       dRef("Regla5_Beneficiario" + str(cBP)),
       name(
          nType("M"),
          fullName(str(cfullName)),
       ),       
         roles(
          rCode("ROL_REGLA_5_BENEFICIARIO"),
          rstat("C"),
       ),      
        number(
          nuType("BP"),
          nValue(str(cBP)),
       ),  
   )


limit = 30000
count = 0

path = '/home/db2inst1/Reglas/'  
path2 = '/home/db2inst1/Reglas_UMF/UMF_Reglas/'


if __name__ == "__main__":
    with open(path + 'Regla_5_Beneficiario.csv') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
	    try:
      		doc = crearUMF(row[0],row[1])
                mensaje = etree.tostring(doc)
# 		print(mensaje,type(mensaje))
                with open(path2 + 'Regla_5_Beneficiario.UMF', 'a+') as archivo:
                    archivo.write(str(mensaje.decode())+"\n")
                if count < limit:
		    count += 1
		else:
		    break
            except ValueError:
                continue       

