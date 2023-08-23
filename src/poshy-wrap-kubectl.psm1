#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


if (-not (Test-Command kubectl)) {
    return
}

function Invoke-Kubectl {
    kubectl @args
}
Set-Alias -Name kc -Value Invoke-Kubectl

function Invoke-KubectlGetPods {
    kubectl get pods @args
}
Set-Alias -Name kcgp -Value Invoke-KubectlGetPods

function Invoke-KubectlGetDeployments {
    kubectl get deployments @args
}
Set-Alias -Name kcgd -Value Invoke-KubectlGetDeployments

function Invoke-KubectlGetNodes {
    kubectl get nodes @args
}
Set-Alias -Name kcgn -Value Invoke-KubectlGetNodes

function Invoke-KubectlDescribePod {
    kubectl describe pod @args
}
Set-Alias -Name kcdp -Value Invoke-KubectlDescribePod

function Invoke-KubectlDescribeDeployment {
    kubectl describe deployment @args
}
Set-Alias -Name kcdd -Value Invoke-KubectlDescribeDeployment

function Invoke-KubectlDescribeNode {
    kubectl describe node @args
}
Set-Alias -Name kcdn -Value Invoke-KubectlDescribeNode

function Invoke-KubectlGetPodsAllNamespaces {
    kubectl get pods --all-namespaces @args
}
Set-Alias -Name kcgpan -Value Invoke-KubectlGetPodsAllNamespaces

function Invoke-KubectlGetDeploymentsAllNamespaces {
    kubectl get deployments --all-namespaces @args
}
Set-Alias -Name kcgdan -Value Invoke-KubectlGetDeploymentsAllNamespaces

# launches a disposable netshoot pod in the k8s cluster
function Invoke-KubectlRunNetshoot {
    kubectl run netshoot-$(date +%s) --rm -i --tty --image nicolaka/netshoot -- /bin/bash
}
Set-Alias -Name kcnetshoot -Value Invoke-KubectlRunNetshoot

# This command is used in daily life
Set-Alias -Name k -Value Invoke-Kubectl

# Execute a kubectl command against all namespaces
function Invoke-KubectlAllNamespaces {
    kubectl @args --all-namespaces
}
Set-Alias -Name kca -Value Invoke-KubectlAllNamespaces

# Apply a YML file
function Invoke-KubectlApplyFromFile {
    kubectl apply -f @args
}
Set-Alias -Name kaf -Value Invoke-KubectlApplyFromFile

# Drop into an interactive terminal on a container
function Invoke-KubectlExecInteractively {
    kubectl exec -t -i @args
}
Set-Alias -Name keti -Value Invoke-KubectlExecInteractively

# Manage configuration quickly to switch contexts between local, dev ad staging.
function Invoke-KubectlConfigUseContext {
    kubectl config use-context @args
}
Set-Alias -Name kcuc -Value Invoke-KubectlConfigUseContext

function Invoke-KubectlConfigSetContext {
    kubectl config set-context @args
}
Set-Alias -Name kcsc -Value Invoke-KubectlConfigSetContext

function Invoke-KubectlConfigDeleteContext {
    kubectl config delete-context @args
}
Set-Alias -Name kcdc -Value Invoke-KubectlConfigDeleteContext

function Invoke-KubectlConfigCurrentContext {
    kubectl config current-context @args
}
Set-Alias -Name kccc -Value Invoke-KubectlConfigCurrentContext

# List all contexts
function Invoke-KubectlConfigGetContexts {
    kubectl config get-contexts @args
}
Set-Alias -Name kcgc -Value Invoke-KubectlConfigGetContexts

# General aliases
function Invoke-KubectlDelete {
    kubectl delete @args
}
Set-Alias -Name kdel -Value Invoke-KubectlDelete

function Invoke-KubectlDeleteFromFile {
    kubectl delete -f @args
}
Set-Alias -Name kdelf -Value Invoke-KubectlDeleteFromFile

# Pod management.
Set-Alias -Name kgp -Value Invoke-KubectlGetPods
Set-Alias -Name kgpa -Value Invoke-KubectlGetPodsAllNamespaces

function Invoke-KubectlGetPodsWatch {
    kubectl get pods --watch @args
}
Set-Alias -Name kgpw -Value Invoke-KubectlGetPodsWatch

function Invoke-KubectlGetPodsWide {
    kubectl get pods -o wide @args
}
Set-Alias -Name kgpwide -Value Invoke-KubectlGetPodsWide

function Invoke-KubectlEditPods {
    kubectl edit pods @args
}
Set-Alias -Name kep -Value Invoke-KubectlEditPods

function Invoke-KubectlDescribePods {
    kubectl describe pods @args
}
Set-Alias -Name kdp -Value Invoke-KubectlDescribePods

function Invoke-KubectlDeletePods {
    kubectl delete pods @args
}
Set-Alias -Name kdelp -Value Invoke-KubectlDeletePods

function Invoke-KubectlGetPodsAllNamespacesWide {
    kubectl get pods --all-namespaces -o wide @args
}
Set-Alias -Name kgpall -Value Invoke-KubectlGetPodsAllNamespacesWide

# get pod by label: kgpl "app=myapp" -n myns
function Invoke-KubectlGetPodsByLabel {
    kubectl get pods -l @args
}
Set-Alias -Name kgpl -Value Invoke-KubectlGetPodsByLabel

# get pod by namespace: kgpn kube-system"
function Invoke-KubectlGetPodsByNamespace {
    kubectl get pods -n @args
}
Set-Alias -Name kgpn -Value Invoke-KubectlGetPodsByNamespace

# Service management.
function Invoke-KubectlGetService {
    kubectl get svc @args
}
Set-Alias -Name kgs -Value Invoke-KubectlGetService

function Invoke-KubectlGetServiceAllNamespaces {
    kubectl get svc --all-namespaces @args
}
Set-Alias -Name kgsa -Value Invoke-KubectlGetServiceAllNamespaces

function Invoke-KubectlGetServiceWatch {
    kubectl get svc --watch @args
}
Set-Alias -Name kgsw -Value Invoke-KubectlGetServiceWatch

function Invoke-KubectlGetServiceWide {
    kubectl get svc -o wide @args
}
Set-Alias -Name kgswide -Value Invoke-KubectlGetServiceWide

function Invoke-KubectlEditService {
    kubectl edit svc @args
}
Set-Alias -Name kes -Value Invoke-KubectlEditService

function Invoke-KubectlDescribeService {
    kubectl describe svc @args
}
Set-Alias -Name kds -Value Invoke-KubectlDescribeService

function Invoke-KubectlDeleteService {
    kubectl delete svc @args
}
Set-Alias -Name kdels -Value Invoke-KubectlDeleteService

# Ingress management
function Invoke-KubectlGetIngress {
    kubectl get ingress @args
}
Set-Alias -Name kgi -Value Invoke-KubectlGetIngress

function Invoke-KubectlGetIngressAllNamespaces {
    kubectl get ingress --all-namespaces @args
}
Set-Alias -Name kgia -Value Invoke-KubectlGetIngressAllNamespaces

function Invoke-KubectlEditIngress {
    kubectl edit ingress @args
}
Set-Alias -Name kei -Value Invoke-KubectlEditIngress

function Invoke-KubectlDescribeIngress {
    kubectl describe ingress @args
}
Set-Alias -Name kdi -Value Invoke-KubectlDescribeIngress

function Invoke-KubectlDeleteIngress {
    kubectl delete ingress @args
}
Set-Alias -Name kdeli -Value Invoke-KubectlDeleteIngress

# Namespace management
function Invoke-KubectlGetNamespaces {
    kubectl get namespaces @args
}
Set-Alias -Name kgns -Value Invoke-KubectlGetNamespaces

function Invoke-KubectlEditNamespace {
    kubectl edit namespace @args
}
Set-Alias -Name kens -Value Invoke-KubectlEditNamespace

function Invoke-KubectlDescribeNamespace {
    kubectl describe namespace @args
}
Set-Alias -Name kdns -Value Invoke-KubectlDescribeNamespace

function Invoke-KubectlDeleteNamespace {
    kubectl delete namespace @args
}
Set-Alias -Name kdelns -Value Invoke-KubectlDeleteNamespace

function Invoke-KubectlConfigSetContextCurrentNamespace {
    kubectl config set-context --current --namespace @args
}
Set-Alias -Name kcn -Value Invoke-KubectlConfigSetContextCurrentNamespace

# ConfigMap management
function Invoke-KubectlGetConfigMaps {
    kubectl get configmaps @args
}
Set-Alias -Name kgcm -Value Invoke-KubectlGetConfigMaps

function Invoke-KubectlGetConfigMapsAllNamespaces {
    kubectl get configmaps --all-namespaces @args
}
Set-Alias -Name kgcma -Value Invoke-KubectlGetConfigMapsAllNamespaces

function Invoke-KubectlEditConfigMap {
    kubectl edit configmap @args
}
Set-Alias -Name kecm -Value Invoke-KubectlEditConfigMap

function Invoke-KubectlDescribeConfigMap {
    kubectl describe configmap @args
}
Set-Alias -Name kdcm -Value Invoke-KubectlDescribeConfigMap

function Invoke-KubectlDeleteConfigMap {
    kubectl delete configmap @args
}
Set-Alias -Name kdelcm -Value Invoke-KubectlDeleteConfigMap

# Secret management
function Invoke-KubectlGetSecret {
    kubectl get secret @args
}
Set-Alias -Name kgsec -Value Invoke-KubectlGetSecret

function Invoke-KubectlGetSecretAllNamespaces {
    kubectl get secret --all-namespaces @args
}
Set-Alias -Name kgseca -Value Invoke-KubectlGetSecretAllNamespaces

function Invoke-KubectlDescribeSecret {
    kubectl describe secret @args
}
Set-Alias -Name kdsec -Value Invoke-KubectlDescribeSecret

function Invoke-KubectlDeleteSecret {
    kubectl delete secret @args
}
Set-Alias -Name kdelsec -Value Invoke-KubectlDeleteSecret

# Deployment management.
function Invoke-KubectlGetDeployment {
    kubectl get deployment @args
}
Set-Alias -Name kgd -Value Invoke-KubectlGetDeployment

function Invoke-KubectlGetDeploymentAllNamespaces {
    kubectl get deployment --all-namespaces @args
}
Set-Alias -Name kgda -Value Invoke-KubectlGetDeploymentAllNamespaces

function Invoke-KubectlGetDeploymentWatch {
    kubectl get deployment --watch @args
}
Set-Alias -Name kgdw -Value Invoke-KubectlGetDeploymentWatch

function Invoke-KubectlGetDeploymentWide {
    kubectl get deployment -o wide @args
}
Set-Alias -Name kgdwide -Value Invoke-KubectlGetDeploymentWide

function Invoke-KubectlEditDeployment {
    kubectl edit deployment @args
}
Set-Alias -Name ked -Value Invoke-KubectlEditDeployment

Set-Alias -Name kdd -Value Invoke-KubectlDescribeDeployment

function Invoke-KubectlDeleteDeployment {
    kubectl delete deployment @args
}
Set-Alias -Name kdeld -Value Invoke-KubectlDeleteDeployment

function Invoke-KubectlScaleDeployment {
    kubectl scale deployment @args
}
Set-Alias -Name ksd -Value Invoke-KubectlScaleDeployment

function Invoke-KubectlRolloutStatusDeployment {
    kubectl rollout status deployment @args
}
Set-Alias -Name krsd -Value Invoke-KubectlRolloutStatusDeployment

function kres {
    [string] $timestamp = [DateTime]::UtcNow.ToString("yyyyMMddHHmmss")
    kubectl set env @args REFRESHED_AT=$timestamp
}

# Rollout management.
function Invoke-KubectlGetReplicaSet {
    kubectl get replicaset @args
}
Set-Alias -Name kgrs -Value Invoke-KubectlGetReplicaSet

function Invoke-KubectlDescribeReplicaSet {
    kubectl describe replicaset @args
}
Set-Alias -Name kdrs -Value Invoke-KubectlDescribeReplicaSet

function Invoke-KubectlEditReplicaSet {
    kubectl edit replicaset @args
}
Set-Alias -Name kers -Value Invoke-KubectlEditReplicaSet

function Invoke-KubectlRolloutHistory {
    kubectl rollout history @args
}
Set-Alias -Name krh -Value Invoke-KubectlRolloutHistory

function Invoke-KubectlRolloutUndo {
    kubectl rollout undo @args
}
Set-Alias -Name kru -Value Invoke-KubectlRolloutUndo

# Statefulset management.
function Invoke-KubectlGetStatefulSet {
    kubectl get statefulset @args
}
Set-Alias -Name kgss -Value Invoke-KubectlGetStatefulSet

function Invoke-KubectlGetStatefulSetAllNamespaces {
    kubectl get statefulset --all-namespaces @args
}
Set-Alias -Name kgssa -Value Invoke-KubectlGetStatefulSetAllNamespaces

function Invoke-KubectlGetStatefulSetWatch {
    kubectl get statefulset --watch @args
}
Set-Alias -Name kgssw -Value Invoke-KubectlGetStatefulSetWatch

function Invoke-KubectlGetStatefulSetWide {
    kubectl get statefulset -o wide @args
}
Set-Alias -Name kgsswide -Value Invoke-KubectlGetStatefulSetWide

function Invoke-KubectlEditStatefulSet {
    kubectl edit statefulset @args
}
Set-Alias -Name kess -Value Invoke-KubectlEditStatefulSet

function Invoke-KubectlDescribeStatefulSet {
    kubectl describe statefulset @args
}
Set-Alias -Name kdss -Value Invoke-KubectlDescribeStatefulSet

function Invoke-KubectlDeleteStatefulSet {
    kubectl delete statefulset @args
}
Set-Alias -Name kdelss -Value Invoke-KubectlDeleteStatefulSet

function Invoke-KubectlScaleStatefulSet {
    kubectl scale statefulset @args
}
Set-Alias -Name ksss -Value Invoke-KubectlScaleStatefulSet

function Invoke-KubectlRolloutStatusStatefulSet {
    kubectl rollout status statefulset @args
}
Set-Alias -Name krsss -Value Invoke-KubectlRolloutStatusStatefulSet

# Port forwarding
function Invoke-KubectlPortForward {
    kubectl port-forward @args
}
Set-Alias -Name kpf -Value Invoke-KubectlPortForward

# Tools for accessing all information
function Invoke-KubectlGetAll {
    kubectl get all @args
}
Set-Alias -Name kga -Value Invoke-KubectlGetAll

function Invoke-KubectlGetAllAllNamespaces {
    kubectl get all --all-namespaces @args
}
Set-Alias -Name kgaa -Value Invoke-KubectlGetAllAllNamespaces

# Logs
function Invoke-KubectlLogs {
    kubectl logs @args
}
Set-Alias -Name kl -Value Invoke-KubectlLogs

function Invoke-KubectlLogsSince1h {
    kubectl logs --since 1h @args
}
Set-Alias -Name kl1h -Value Invoke-KubectlLogsSince1h

function Invoke-KubectlLogsSince1m {
    kubectl logs --since 1m @args
}
Set-Alias -Name kl1m -Value Invoke-KubectlLogsSince1m

function Invoke-KubectlLogsSince1s {
    kubectl logs --since 1s @args
}
Set-Alias -Name kl1s -Value Invoke-KubectlLogsSince1s

function Invoke-KubectlLogsFollow {
    kubectl logs -f @args
}
Set-Alias -Name klf -Value Invoke-KubectlLogsFollow

function Invoke-KubectlLogsSince1hFollow {
    kubectl logs --since 1h -f @args
}
Set-Alias -Name klf1h -Value Invoke-KubectlLogsSince1hFollow

function Invoke-KubectlLogsSince1mFollow {
    kubectl logs --since 1m -f @args
}
Set-Alias -Name klf1m -Value Invoke-KubectlLogsSince1mFollow

function Invoke-KubectlLogsSince1sFollow {
    kubectl logs --since 1s -f @args
}
Set-Alias -Name klf1s -Value Invoke-KubectlLogsSince1sFollow

# File copy
function Invoke-KubectlCopy {
    kubectl cp @args
}
Set-Alias -Name kcp -Value Invoke-KubectlCopy

# Node Management
Set-Alias -Name kgno -Value Invoke-KubectlGetNodes

function Invoke-KubectlEditNode {
    kubectl edit node @args
}
Set-Alias -Name keno -Value Invoke-KubectlEditNode

Set-Alias -Name kdno -Value Invoke-KubectlDescribeNode

function Invoke-KubectlDeleteNode {
    kubectl delete node @args
}
Set-Alias -Name kdelno -Value Invoke-KubectlDeleteNode

# PVC management.
function Invoke-KubectlGetPersistentVolumeClaim {
    kubectl get pvc @args
}
Set-Alias -Name kgpvc -Value Invoke-KubectlGetPersistentVolumeClaim

function Invoke-KubectlGetPersistentVolumeClaimAllNamespaces {
    kubectl get pvc --all-namespaces @args
}
Set-Alias -Name kgpvca -Value Invoke-KubectlGetPersistentVolumeClaimAllNamespaces

function Invoke-KubectlGetPersistentVolumeClaimWatch {
    kubectl get pvc --watch @args
}
Set-Alias -Name kgpvcw -Value Invoke-KubectlGetPersistentVolumeClaimWatch

function Invoke-KubectlEditPersistentVolumeClaim {
    kubectl edit pvc @args
}
Set-Alias -Name kepvc -Value Invoke-KubectlEditPersistentVolumeClaim

function Invoke-KubectlDescribePersistentVolumeClaim {
    kubectl describe pvc @args
}
Set-Alias -Name kdpvc -Value Invoke-KubectlDescribePersistentVolumeClaim

function Invoke-KubectlDeletePersistentVolumeClaim {
    kubectl delete pvc @args
}
Set-Alias -Name kdelpvc -Value Invoke-KubectlDeletePersistentVolumeClaim

# Service account management.
function Invoke-KubectlDescribeServiceAccount {
    kubectl describe sa @args
}
Set-Alias -Name kdsa -Value Invoke-KubectlDescribeServiceAccount

function Invoke-KubectlDeleteServiceAccount {
    kubectl delete sa @args
}
Set-Alias -Name kdelsa -Value Invoke-KubectlDeleteServiceAccount

# DaemonSet management.
function Invoke-KubectlGetDaemonSet {
    kubectl get daemonset @args
}
Set-Alias -Name kgds -Value Invoke-KubectlGetDaemonSet

function Invoke-KubectlGetDaemonSetWatch {
    kubectl get daemonset --watch @args
}
Set-Alias -Name kgdsw -Value Invoke-KubectlGetDaemonSetWatch

function Invoke-KubectlEditDaemonSet {
    kubectl edit daemonset @args
}
Set-Alias -Name keds -Value Invoke-KubectlEditDaemonSet

function Invoke-KubectlDescribeDaemonSet {
    kubectl describe daemonset @args
}
Set-Alias -Name kdds -Value Invoke-KubectlDescribeDaemonSet

function Invoke-KubectlDeleteDaemonSet {
    kubectl delete daemonset @args
}
Set-Alias -Name kdelds -Value Invoke-KubectlDeleteDaemonSet

# CronJob management.
function Invoke-KubectlGetCronJob {
    kubectl get cronjob @args
}
Set-Alias -Name kgcj -Value Invoke-KubectlGetCronJob

function Invoke-KubectlEditCronJob {
    kubectl edit cronjob @args
}
Set-Alias -Name kecj -Value 'kubectl edit cronjob'

function Invoke-KubectlDescribeCronJob {
    kubectl describe cronjob @args
}
Set-Alias -Name kdcj -Value Invoke-KubectlDescribeCronJob

function Invoke-KubectlDeleteCronJob {
    kubectl delete cronjob @args
}
Set-Alias -Name kdelcj -Value Invoke-KubectlDeleteCronJob

# Job management.
function Invoke-KubectlGetJob {
    kubectl get job @args
}
Set-Alias -Name kgj -Value Invoke-KubectlGetJob

function Invoke-KubectlEditJob {
    kubectl edit job @args
}
Set-Alias -Name kej -Value Invoke-KubectlEditJob

function Invoke-KubectlDescribeJob {
    kubectl describe job @args
}
Set-Alias -Name kdj -Value Invoke-KubectlDescribeJob

function Invoke-KubectlDeleteJob {
    kubectl delete job @args
}
Set-Alias -Name kdelj -Value Invoke-KubectlDeleteJob


Export-ModuleMember -Function * -Alias *
