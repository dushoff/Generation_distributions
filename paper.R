# dev.off(); pdf(pdfname, width=7)
dgen <- dgen[dgen<=40]
leftZones()
funHist(dgen, expfun, finv=logfun, parms=list(Tc=15), top=2000)
funHist(dgen, expfun, finv=logfun, parms=list(Tc=45), top=2000)
# funHist(dgen, idfun, finv=idfun, parms=list(Tc=450), top=2000)
