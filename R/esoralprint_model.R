# Internal model coefficients
#' @keywords internal
esoral_model <- list(
  intercept = 0.57,
  isoPairs = data.frame(
    gene_h = c("TFRC","SPP1","SPP1","MRPL47","GABRE","S100A7A","SNAPC1",
               "SPP1","WDR72","NACC2","TMEM37","RASSF6","SLC39A4","HOXC6",
               "BCAP31","BASP1","MMP3","MRPL32","PFN2","PSRC1","RPN1",
               "TUBB3","RPA1","FZD6","GABRE","EPPK1","RMI1","TCEAL1",
               "WIPI1","CD38","ABCC5","NMB","SPP1","IGLL3P"),
    gene_k = c("PDCD6","CDH5","TMED1","DCTN3","RBP7","RBP7","C2orf76",
               "SYNE3","DCT","COBL","COBL","COBL","GCHFR","CNNM4",
               "GPX3","GPX3","IL11RA","ACADVL","KPNA4","ROR1","PDHB",
               "PHYH","PHYH","PITPNA","ANO10","PLGRKT","BEX4","BEX4",
               "PRSS3","RELN","SMIM5","TYRP1","ISOC2","SRPX"),
    beta = c(0.82,-0.0118,-0.4465,-0.3937,0.4435,0.4175,-0.0991,
             0.236,0.8053,-0.3026,1.1657,0.2747,0.5268,0.6084,
             0.367,0.2465,0.1009,-0.5867,1.0829,0.0847,0.4986,
             0.293,-0.2801,0.7005,0.8422,0.9945,-0.1426,0.6823,
             0.3753,-0.0493,0.1703,0.4959,0.6145,-0.0808)
  )
)
