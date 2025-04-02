@echo off
echo [Step 1] Helm 리소스 삭제: argocd
terraform destroy -target=helm_release.argocd -auto-approve
IF ERRORLEVEL 1 (
    echo Helm 삭제 실패. 중단합니다.
    exit /b 1
)

echo.
echo [Step 2] Ingress 리소스 삭제: argocd_ingress
terraform destroy -target=kubernetes_ingress_v1.argocd_ingress -auto-approve
IF ERRORLEVEL 1 (
    echo Ingress 삭제 실패. 중단합니다.
    exit /b 1
)

echo.
echo [Step 3] Terraform state에서 Helm, Ingress 제거
terraform state rm helm_release.argocd
terraform state rm kubernetes_ingress_v1.argocd_ingress

echo.
echo [Step 4] 전체 리소스 삭제 시작
terraform destroy -auto-approve

IF ERRORLEVEL 1 (
    echo 전체 삭제 중 일부 오류 발생. 확인 필요.
) ELSE (
    echo 전체 리소스 삭제 완료!
)
pause
