## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(classIUPUI)

## -----------------------------------------------------------------------------
# collects the gse object
gse <- import_GEO("GSE33126")


## -----------------------------------------------------------------------------

out_list <- GEO_data(gse)

phenotype_data <- out_list[['Phenotype_data']]

expression_data <- out_list[['Expression_data']]

annotation_data <- out_list[['Annotation_data']]


## -----------------------------------------------------------------------------

expression_data <- check_Values(expression_data)


## -----------------------------------------------------------------------------

sample_info <- sample_Simplify(phenotype_data)


## -----------------------------------------------------------------------------

# annotated heatmap
GEO_heatmap(expression_data,sample_info)

# unannotated heatmap
GEO_heatmap(expression_data)


## -----------------------------------------------------------------------------

PCA(expression_data,sample_info)


## -----------------------------------------------------------------------------
# additional options include the number of threshold genes and the names for column 1 and 2
fit2 <- differential_Expression_limma(gse,sample_info,2,"col1","col2")


## -----------------------------------------------------------------------------
# any top number of genes can be chosen
top_genes_frame <- annotate_fit(annotation_data,fit2,50)


## -----------------------------------------------------------------------------
# any p-value cut off can be chosen for option 3
volcano_plot(top_genes_frame,fit2,0.05)


## -----------------------------------------------------------------------------

MA_plot(fit2,top_genes_frame)


## -----------------------------------------------------------------------------
# any p-value cut off can be chosen for option 3
x_enrichedPathway <- reactome_analysis_enrich(top_genes_frame,0.05)
print(x_enrichedPathway)


## -----------------------------------------------------------------------------

# any p-value cut off can be chosen for option 3
y_gsePathway <- reactome_analysis_gse(top_genes_frame,0.05)
print(y_gsePathway)

## -----------------------------------------------------------------------------
# any p-value cut off can be chosen for option 3
z_disease_enrichment <- disease_enrichment_analysis(top_genes_frame,0.05)
print(z_disease_enrichment)

