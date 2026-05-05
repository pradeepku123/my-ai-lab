# 🧪 AI/ML Validation Upskilling Lab

A **fully Dockerized** practice environment covering all 3 phases of the AI/ML Validation upskilling roadmap.

---

## 🚀 Quick Start

```bash
# One command to launch everything
./start-lab.sh
```

> First run takes ~10 minutes (building the JupyterLab image with all libraries).

---

## 🌐 Services & URLs

| Service | URL | Credentials |
|---------|-----|-------------|
| 📓 **JupyterLab** | http://localhost:8888 | No password |
| 📊 **MLflow UI** | http://localhost:5000 | No auth |
| 📈 **Grafana** | http://localhost:3000 | admin / ailab123 |
| 🔍 **Prometheus** | http://localhost:9090 | No auth |
| 🌊 **Evidently UI** | http://localhost:8000 | No auth |

---

## 📚 Notebooks (in order)

| # | File | Phase | Topic |
|---|------|-------|-------|
| 01 | `01_phase1_evaluation_metrics.ipynb` | Phase 1 | ROC-AUC vs PR-AUC, F1, MCC, Log Loss |
| 02 | `02_phase1_xai_shap_lime.ipynb` | Phase 1 | SHAP global/local, LIME explanations |
| 03 | `03_phase2_bias_fairness.ipynb` | Phase 2 | Fairlearn, Demographic Parity, Mitigation |
| 04 | `04_phase2_drift_detection.ipynb` | Phase 2 | KS test, PSI, Evidently reports |
| 05 | `05_phase3_mlflow_tracking.ipynb` | Phase 3 | Experiment tracking, Optuna HPO |
| 06 | `06_phase3_monitoring_prometheus.ipynb` | Phase 3 | Prometheus metrics, Grafana dashboards |

---

## 🗂 Project Structure

```
my-ai-lab/
├── docker-compose.yml        # All 5 services
├── start-lab.sh              # One-click startup
├── jupyter/
│   └── Dockerfile            # JupyterLab + all ML libs
├── notebooks/                # 6 practice notebooks
├── data/                     # Outputs: plots, HTML reports
├── prometheus/
│   └── prometheus.yml        # Scrape config
└── grafana/
    └── provisioning/         # Auto-provisioned datasource
```

---

## 🛠 Common Commands

```bash
# Start lab
./start-lab.sh

# Stop everything
docker compose down

# View logs for a service
docker compose logs -f jupyter
docker compose logs -f mlflow

# Rebuild JupyterLab (after Dockerfile changes)
docker compose build jupyter && docker compose up -d jupyter

# Shell into JupyterLab container
docker compose exec jupyter bash
```

---

## 📖 Upskilling Roadmap

### Phase 1: Technical Core (Months 1–3)
- ✅ Advanced Evaluation Metrics (Notebook 01)
- ✅ Explainability – SHAP & LIME (Notebook 02)
- 📌 Statistical Robustness: K-Fold, Regularization, Hypothesis Testing

### Phase 2: Validation Engineering (Months 4–6)
- ✅ Bias & Fairness – Fairlearn (Notebook 03)
- ✅ Data & Concept Drift – Evidently (Notebook 04)
- 📌 Behavioral Testing: Metamorphic Testing
- 📌 Data Quality: Great Expectations

### Phase 3: Production Validation & MLOps (Months 7–12)
- ✅ Experiment Tracking – MLflow + Optuna (Notebook 05)
- ✅ Monitoring – Prometheus + Grafana (Notebook 06)
- 📌 CI/CD for ML: GitHub Actions gates
