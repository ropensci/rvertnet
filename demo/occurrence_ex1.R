# Taxon
a1 = vertoccurrence(t="notropis",num=100)
a2 = vertoccurrence(t="notropis or nezumia",num=100)
a3 = vertoccurrence(t="Blenniidae",num=100)
# Location
a4 = vertoccurrence(l="country:india",num=100)
a5 = vertoccurrence(l="alabama or gulf of mexico",num=100)
a6 = vertoccurrence(l="africa",num=100,grp="bird")
# Catalog Number/Institution Code
a7 = vertoccurrence(c="TU 1")
a8 = vertoccurrence(c="mnhn or usnm",num=100)
a9 = vertoccurrence(c="ku 29288 or tu 66762")
# Date Range
a10 = vertoccurrence(d="2000-2000",num=100)
a11 = vertoccurrence(d="1950-1975",num=100)
# Other keywords
a12 = vertoccurrence(q="larva",num=100)
a13 = vertoccurrence(q="ethanol or EtOH",num=100)
# Geometry
a14 = vertoccurrence(p="POLYGON((-93.998292265615 32.615318339629,-92.471192656236 32.606063985828,-92.635987578112 31.235349580893,-90.988038359361 31.19776691287,-90.955079374988 30.395621231989,-93.94336062499 30.386144489302,-93.998292265615 32.615318339629))",num=100)
# Map
a15 = vertoccurrence(m=14,num=100)
# Columns
a16 = vertoccurrence(t="notropis",num=100, cols="Latitude,Longitude,Family,ScientificName,IndividualCount,Remarks")
# Start Value
a17 = vertoccurrence(t="notropis",set=1,num=10)
a18 = vertoccurrence(t="notropis",set=11,num=10)
#Wrong name
a19 = vertoccurrence(t="notropisz",num=100)