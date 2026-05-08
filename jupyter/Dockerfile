# ─────────────────────────────────────────────
#  JupyterLab – AI/ML Upskilling Lab
#  Based on jupyter/scipy-notebook (Python 3.11)
# ─────────────────────────────────────────────
FROM jupyter/scipy-notebook:python-3.11

USER root

# System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    wget \
    vim \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# ── Phase 1: Core Evaluation & Metrics ────────
# Advanced model evaluation, statistical testing, XAI
RUN pip install --no-cache-dir \
    scikit-learn==1.5.0 \
    xgboost==2.0.3 \
    lightgbm==4.3.0 \
    imbalanced-learn==0.12.3 \
    shap==0.45.1 \
    lime==0.2.0.1 \
    interpret==0.6.3 \
    statsmodels==0.14.2 \
    scipy==1.13.0 \
    pingouin==0.5.4

# ── Phase 2: Validation Engineering ───────────
# Bias/Fairness, Drift Detection, Data Quality
RUN pip install --no-cache-dir \
    evidently==0.4.30 \
    deepchecks==0.18.1 \
    fairlearn==0.10.0 \
    aif360==0.6.1 \
    great-expectations==0.18.19 \
    ydata-profiling==4.8.3

# ── Phase 3: MLOps ─────────────────────────────
# Experiment tracking, model versioning, monitoring
RUN pip install --no-cache-dir \
    mlflow==2.13.2 \
    optuna==3.6.1 \
    prometheus-client==0.20.0 \
    psutil==5.9.8 \
    requests==2.32.3

# ── Phase 4: GenAI & LLM Evaluation ───────────
# RAG evaluation, LLM-as-a-Judge, semantic metrics
RUN pip install --no-cache-dir \
    ragas==0.1.9 \
    deepeval==0.21.51 \
    bert-score==0.3.13 \
    rouge-score==0.1.2 \
    langchain==0.2.1 \
    langchain-openai==0.1.8 \
    langchain-community==0.2.1

# ── Visualization & Utilities ─────────────────
RUN pip install --no-cache-dir \
    matplotlib==3.9.0 \
    seaborn==0.13.2 \
    plotly==5.22.0 \
    ipywidgets==8.1.3 \
    pandas==2.2.2 \
    numpy==1.26.4 \
    tqdm==4.66.4 \
    python-dotenv==1.0.1

# ── JupyterLab Extensions ─────────────────────
RUN pip install --no-cache-dir \
    jupyterlab-git==0.50.1 \
    jupyterlab-execute-time==3.1.2 \
    nbformat==5.10.4

# Set working directory
WORKDIR /home/jovyan/work

# Token-free access for local dev (bind to localhost only via docker-compose)
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", \
     "--NotebookApp.token=''", "--NotebookApp.password=''", \
     "--notebook-dir=/home/jovyan/work"]
