* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
* Diagrammerstellung.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Alter MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  GUIDE: axis(dim(1), label("Alter"))
  GUIDE: axis(dim(2), label("Häufigkeit"))
  GUIDE: text.title(label("Einfache Balken von Alter"))
  ELEMENT: interval(position(summary.count(bin.rect(Alter))), shape.interior(shape.square))
END GPL.

* Diagrammerstellung.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Geschlecht1männlich0weiblich COUNT()[name="COUNT"] 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  GUIDE: axis(dim(1), label("Geschlecht 1 männlich 0 weiblich"))
  GUIDE: axis(dim(2), label("Anzahl"))
  GUIDE: text.title(label("Einfache Balken Anzahl von Geschlecht 1 männlich 0 weiblich"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval(position(Geschlecht1männlich0weiblich*COUNT), shape.interior(shape.square))
END GPL.

* Diagrammerstellung.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Schulabschluss COUNT()[name="COUNT"] MISSING=LISTWISE 
    REPORTMISSING=YES
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  GUIDE: axis(dim(1), label("Schulabschluss"))
  GUIDE: axis(dim(2), label("Anzahl"))
  GUIDE: text.title(label("Einfache Balken Anzahl von Schulabschluss"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval(position(Schulabschluss*COUNT), shape.interior(shape.square))
END GPL.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10) TOLERANCE(.0001)
  /NOORIGIN 
  /DEPENDENT EsIEinschätzungsindex
  /METHOD=ENTER IdIIdentifikationsindex.

* Diagrammerstellung.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=IdIIdentifikationsindex EsIEinschätzungsindex 
    MISSING=LISTWISE REPORTMISSING=YES
  /GRAPHSPEC SOURCE=INLINE
  /FITLINE TOTAL=YES SUBGROUP=NO.
BEGIN GPL
  GUIDE: axis(dim(1), label("IdI Identifikationsindex"))
  GUIDE: axis(dim(2), label("EsI Einschätzungsindex"))
  GUIDE: text.title(label("Streudiagramm von EsI Einschätzungsindex Schritt: IdI ",
    "Identifikationsindex"))
  ELEMENT: point(position(IdIIdentifikationsindex*EsIEinschätzungsindex))
END GPL.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10) TOLERANCE(.0001)
  /NOORIGIN 
  /DEPENDENT WiebedeutendistWirtschaft
  /METHOD=ENTER IdIIdentifikationsindex.

* Diagrammerstellung.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=IdIIdentifikationsindex WiebedeutendistWirtschaft 
    MISSING=LISTWISE REPORTMISSING=YES
  /GRAPHSPEC SOURCE=INLINE
  /FITLINE TOTAL=YES SUBGROUP=NO.
BEGIN GPL
  GUIDE: axis(dim(1), label("IdI Identifikationsindex"))
  GUIDE: axis(dim(2), label("Wie bedeutend ist Wirtschaft"))
  GUIDE: text.title(label("Streudiagramm von Wie bedeutend ist Wirtschaft Schritt: IdI ",
    "Identifikationsindex"))
  ELEMENT: point(position(IdIIdentifikationsindex*WiebedeutendistWirtschaft))
END GPL.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10) TOLERANCE(.0001)
  /NOORIGIN 
  /DEPENDENT EsIEinschätzungsindex
  /METHOD=ENTER IdIIdentifikationsindex Geschlecht1männlich0weiblich.

* Diagrammerstellung.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Geschlecht1männlich0weiblich IdIIdentifikationsindex 
    EsIEinschätzungsindex MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE
  /FITLINE TOTAL=NO.
BEGIN GPL
  COORD: rect(dim(1,2,3))
  GUIDE: axis(dim(1), label("EsI Einschätzungsindex"))
  GUIDE: axis(dim(2), label("Geschlecht 1 männlich 0 weiblich"))
  GUIDE: axis(dim(3), label("IdI Identifikationsindex"))
  GUIDE: text.title(label("Einfaches 3-D-Streudiagramm von IdI Identifikationsindex Schritt: ",
    "Geschlecht 1 männlich 0 weiblich Schritt: EsI Einschätzungsindex"))
  SCALE: linear(dim(3), include(0))
  SCALE: linear(dim(1), include(0))
  ELEMENT: point(position(EsIEinschätzungsindex*Geschlecht1männlich0weiblich*
    IdIIdentifikationsindex))
END GPL.
