#!/usr/bin/env bash
# ─────────────────────────────────────────────
#  AI/ML Upskilling Lab – Startup Script
# ─────────────────────────────────────────────
set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${CYAN}${BOLD}"
echo "  ╔══════════════════════════════════════════╗"
echo "  ║     AI / ML Upskilling Lab               ║"
echo "  ║     Dockerized Practice Environment      ║"
echo "  ╚══════════════════════════════════════════╝"
echo -e "${NC}"

# Check docker
if ! command -v docker &> /dev/null; then
    echo -e "${RED}Docker is not installed. Please install Docker first.${NC}"
    exit 1
fi

echo -e "${YELLOW}Pulling base images (first time may take a few minutes)...${NC}"
docker compose pull mlflow prometheus grafana 2>/dev/null || true

echo -e "${YELLOW}Building JupyterLab image (installs all ML libraries)...${NC}"
echo -e "${CYAN}  This takes ~5-10 minutes on first run. Grab a coffee! ☕${NC}"
docker compose build jupyter

echo -e "${GREEN}Starting all services...${NC}"
docker compose up -d

echo -e "\n${YELLOW}Waiting for services to be ready...${NC}"
sleep 10

# Health checks
check_service() {
    local name=$1
    local url=$2
    local max_attempts=30
    local attempt=0
    while [ $attempt -lt $max_attempts ]; do
        if curl -sf "$url" > /dev/null 2>&1; then
            echo -e "  ${GREEN}✅ $name is ready${NC}"
            return 0
        fi
        attempt=$((attempt + 1))
        sleep 3
    done
    echo -e "  ${YELLOW}⏳ $name is still starting (check with: docker compose logs $name)${NC}"
}

check_service "JupyterLab" "http://localhost:8888/api"
check_service "MLflow"     "http://localhost:5000/health"
check_service "Prometheus" "http://localhost:9090/-/healthy"
check_service "Grafana"    "http://localhost:3000/api/health"

echo -e "\n${GREEN}${BOLD}═══════════════════════════════════════════${NC}"
echo -e "${GREEN}${BOLD}  🚀 Lab is UP! Access your tools:${NC}"
echo -e "${GREEN}${BOLD}═══════════════════════════════════════════${NC}"
echo -e "  ${CYAN}📓 JupyterLab   →  http://localhost:8888${NC}"
echo -e "  ${CYAN}📊 MLflow UI    →  http://localhost:5000${NC}"
echo -e "  ${CYAN}📈 Grafana      →  http://localhost:3000  (admin/ailab123)${NC}"
echo -e "  ${CYAN}🔍 Prometheus   →  http://localhost:9090${NC}"
echo -e "  ${CYAN}🌊 Evidently UI →  http://localhost:8000  (may take 2-3 min)${NC}"
echo -e "\n  ${YELLOW}📂 Notebooks are in: ./notebooks/${NC}"
echo -e "  ${YELLOW}💾 Data outputs in:  ./data/${NC}"
echo -e "\n  Stop lab:  ${BOLD}docker compose down${NC}"
echo -e "  View logs: ${BOLD}docker compose logs -f [service]${NC}"
echo ""
