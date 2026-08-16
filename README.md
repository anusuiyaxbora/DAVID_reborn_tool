# 👋 About Me

I am a **Bioinformatics & Computational Biology Researcher** (PhD Candidate at Deakin University & Burnet Institute) specialising in high-dimensional transcriptomics analysis, and reproducible data analysis techniques. 

- 🧬 **Research Focus:** Bulk & single-cell RNA-seq (scRNA-seq) analysis, and computational reproducibility.
- 🎓 **Community & Education:** Leading hands-on workshops on reproducible enrichment analysis and modern R package standards. Published guidelines on performing reproducible functional enrichment analysis.

# DAVID Reborn Tool - Project Overview 

DAVID v6.8 (Database for Annotation, Visualization and Integrated Discovery) was a cornerstone web tool for functional annotation and pathway enrichment analysis, cited in **~100,000 biomedical studies** across high- and low-impact journals. Following the extinction of the v6.8 web version, reproducing or validating these historical analyses has become virtually impossible for the scientific community.

This project addresses this critical gap in computational reproducibility by:
1. **Revival of extinct DAVID version for Gene Ontology:** Reconstructing the archived knowledgebase and annotation mappings underlying DAVID v6.8 for Gene Ontology.
2. **Reproducibility Audit:** Evaluating the sensitivity of published enrichment results to outdated gene knowledgebases, default background specifications, and software version shifts across transcriptomic studies (bulk & single-cell RNA-seq).
3. **Open R Framework:** Providing a reproducible R package/workflow to recreate historical DAVID v6.8 outputs programmatically.


# 🔬 Key Scientific & Methodological Findings

- **Journal Impact Irrelevance:** Methodological deficiencies (such as relying on whole-genome default backgrounds instead of assay-specific background universes) degrade enrichment accuracy **irrespective of journal impact factor**.
- **Knowledgebase Drift:** Variations occur as knowledgebases are updated. This also results in changes to the p-values and over-representation analysis (ORA) term rankings for identical input gene lists.
- Developing a threshold to consider the reproducibility of computational analysis like enrichment analysis.

## Data files
Data files are private until the official submission of PhD thesis.
