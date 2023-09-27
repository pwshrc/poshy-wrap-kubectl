#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


if (-not (Test-Command kubectl) -and (-not (Get-Variable -Name PWSHRC_FORCE_MODULES_EXPORT_UNSUPPORTED -Scope Global -ValueOnly -ErrorAction SilentlyContinue))) {
    return
}

function Invoke-Kubectl {
    kubectl @args
}
Set-Alias -Name kc -Value Invoke-Kubectl
Export-ModuleMember -Function Invoke-Kubectl -Alias kc

function Invoke-KubectlGetPods {
    kubectl get pods @args
}
Set-Alias -Name kcgp -Value Invoke-KubectlGetPods
Export-ModuleMember -Function Invoke-KubectlGetPods -Alias kcgp

function Invoke-KubectlGetDeployments {
    kubectl get deployments @args
}
Set-Alias -Name kcgd -Value Invoke-KubectlGetDeployments
Export-ModuleMember -Function Invoke-KubectlGetDeployments -Alias kcgd

function Invoke-KubectlGetNodes {
    kubectl get nodes @args
}
Set-Alias -Name kcgn -Value Invoke-KubectlGetNodes
Export-ModuleMember -Function Invoke-KubectlGetNodes -Alias kcgn

function Invoke-KubectlDescribePod {
    kubectl describe pod @args
}
Set-Alias -Name kcdp -Value Invoke-KubectlDescribePod
Export-ModuleMember -Function Invoke-KubectlDescribePod -Alias kcdp

function Invoke-KubectlDescribeDeployment {
    kubectl describe deployment @args
}
Set-Alias -Name kcdd -Value Invoke-KubectlDescribeDeployment
Export-ModuleMember -Function Invoke-KubectlDescribeDeployment -Alias kcdd

function Invoke-KubectlDescribeNode {
    kubectl describe node @args
}
Set-Alias -Name kcdn -Value Invoke-KubectlDescribeNode
Export-ModuleMember -Function Invoke-KubectlDescribeNode -Alias kcdn

function Invoke-KubectlGetPodsAllNamespaces {
    kubectl get pods --all-namespaces @args
}
Set-Alias -Name kcgpan -Value Invoke-KubectlGetPodsAllNamespaces
Export-ModuleMember -Function Invoke-KubectlGetPodsAllNamespaces -Alias kcgpan

function Invoke-KubectlGetDeploymentsAllNamespaces {
    kubectl get deployments --all-namespaces @args
}
Set-Alias -Name kcgdan -Value Invoke-KubectlGetDeploymentsAllNamespaces
Export-ModuleMember -Function Invoke-KubectlGetDeploymentsAllNamespaces -Alias kcgdan

# launches a disposable netshoot pod in the k8s cluster
function Invoke-KubectlRunNetshoot {
    kubectl run netshoot-$(date +%s) --rm -i --tty --image nicolaka/netshoot -- /bin/bash
}
Set-Alias -Name kcnetshoot -Value Invoke-KubectlRunNetshoot
Export-ModuleMember -Function Invoke-KubectlRunNetshoot -Alias kcnetshoot

# This command is used in daily life
Set-Alias -Name k -Value Invoke-Kubectl
Export-ModuleMember -Alias k

# Execute a kubectl command against all namespaces
function Invoke-KubectlAllNamespaces {
    kubectl @args --all-namespaces
}
Set-Alias -Name kca -Value Invoke-KubectlAllNamespaces
Export-ModuleMember -Function Invoke-KubectlAllNamespaces -Alias kca

# Apply a YML file
function Invoke-KubectlApplyFromFile {
    kubectl apply -f @args
}
Set-Alias -Name kaf -Value Invoke-KubectlApplyFromFile
Export-ModuleMember -Function Invoke-KubectlApplyFromFile -Alias kaf

# Drop into an interactive terminal on a container
function Invoke-KubectlExecInteractively {
    kubectl exec -t -i @args
}
Set-Alias -Name keti -Value Invoke-KubectlExecInteractively
Export-ModuleMember -Function Invoke-KubectlExecInteractively -Alias keti

# Manage configuration quickly to switch contexts between local, dev ad staging.
function Invoke-KubectlConfigUseContext {
    kubectl config use-context @args
}
Set-Alias -Name kcuc -Value Invoke-KubectlConfigUseContext
Export-ModuleMember -Function Invoke-KubectlConfigUseContext -Alias kcuc

function Invoke-KubectlConfigSetContext {
    kubectl config set-context @args
}
Set-Alias -Name kcsc -Value Invoke-KubectlConfigSetContext
Export-ModuleMember -Function Invoke-KubectlConfigSetContext -Alias kcsc

function Invoke-KubectlConfigDeleteContext {
    kubectl config delete-context @args
}
Set-Alias -Name kcdc -Value Invoke-KubectlConfigDeleteContext
Export-ModuleMember -Function Invoke-KubectlConfigDeleteContext -Alias kcdc

function Invoke-KubectlConfigCurrentContext {
    kubectl config current-context @args
}
Set-Alias -Name kccc -Value Invoke-KubectlConfigCurrentContext
Export-ModuleMember -Function Invoke-KubectlConfigCurrentContext -Alias kccc

# List all contexts
function Invoke-KubectlConfigGetContexts {
    kubectl config get-contexts @args
}
Set-Alias -Name kcgc -Value Invoke-KubectlConfigGetContexts
Export-ModuleMember -Function Invoke-KubectlConfigGetContexts -Alias kcgc

# General aliases
function Invoke-KubectlDelete {
    kubectl delete @args
}
Set-Alias -Name kdel -Value Invoke-KubectlDelete
Export-ModuleMember -Function Invoke-KubectlDelete -Alias kdel

function Invoke-KubectlDeleteFromFile {
    kubectl delete -f @args
}
Set-Alias -Name kdelf -Value Invoke-KubectlDeleteFromFile
Export-ModuleMember -Function Invoke-KubectlDeleteFromFile -Alias kdelf

# Pod management.
Set-Alias -Name kgp -Value Invoke-KubectlGetPods
Set-Alias -Name kgpa -Value Invoke-KubectlGetPodsAllNamespaces
Export-ModuleMember -Alias "kgp", "kgpa"

function Invoke-KubectlGetPodsWatch {
    kubectl get pods --watch @args
}
Set-Alias -Name kgpw -Value Invoke-KubectlGetPodsWatch
Export-ModuleMember -Function Invoke-KubectlGetPodsWatch -Alias kgpw

function Invoke-KubectlGetPodsWide {
    kubectl get pods -o wide @args
}
Set-Alias -Name kgpwide -Value Invoke-KubectlGetPodsWide
Export-ModuleMember -Function Invoke-KubectlGetPodsWide -Alias kgpwide

function Invoke-KubectlEditPods {
    kubectl edit pods @args
}
Set-Alias -Name kep -Value Invoke-KubectlEditPods
Export-ModuleMember -Function Invoke-KubectlEditPods -Alias kep

function Invoke-KubectlDescribePods {
    kubectl describe pods @args
}
Set-Alias -Name kdp -Value Invoke-KubectlDescribePods
Export-ModuleMember -Function Invoke-KubectlDescribePods -Alias kdp

function Invoke-KubectlDeletePods {
    kubectl delete pods @args
}
Set-Alias -Name kdelp -Value Invoke-KubectlDeletePods
Export-ModuleMember -Function Invoke-KubectlDeletePods -Alias kdelp

function Invoke-KubectlGetPodsAllNamespacesWide {
    kubectl get pods --all-namespaces -o wide @args
}
Set-Alias -Name kgpall -Value Invoke-KubectlGetPodsAllNamespacesWide
Export-ModuleMember -Function Invoke-KubectlGetPodsAllNamespacesWide -Alias kgpall

# get pod by label: kgpl "app=myapp" -n myns
function Invoke-KubectlGetPodsByLabel {
    kubectl get pods -l @args
}
Set-Alias -Name kgpl -Value Invoke-KubectlGetPodsByLabel
Export-ModuleMember -Function Invoke-KubectlGetPodsByLabel -Alias kgpl

# get pod by namespace: kgpn kube-system"
function Invoke-KubectlGetPodsByNamespace {
    kubectl get pods -n @args
}
Set-Alias -Name kgpn -Value Invoke-KubectlGetPodsByNamespace
Export-ModuleMember -Function Invoke-KubectlGetPodsByNamespace -Alias kgpn

# Service management.
function Invoke-KubectlGetService {
    kubectl get svc @args
}
Set-Alias -Name kgs -Value Invoke-KubectlGetService
Export-ModuleMember -Function Invoke-KubectlGetService -Alias kgs

function Invoke-KubectlGetServiceAllNamespaces {
    kubectl get svc --all-namespaces @args
}
Set-Alias -Name kgsa -Value Invoke-KubectlGetServiceAllNamespaces
Export-ModuleMember -Function Invoke-KubectlGetServiceAllNamespaces -Alias kgsa

function Invoke-KubectlGetServiceWatch {
    kubectl get svc --watch @args
}
Set-Alias -Name kgsw -Value Invoke-KubectlGetServiceWatch
Export-ModuleMember -Function Invoke-KubectlGetServiceWatch -Alias kgsw

function Invoke-KubectlGetServiceWide {
    kubectl get svc -o wide @args
}
Set-Alias -Name kgswide -Value Invoke-KubectlGetServiceWide
Export-ModuleMember -Function Invoke-KubectlGetServiceWide -Alias kgswide

function Invoke-KubectlEditService {
    kubectl edit svc @args
}
Set-Alias -Name kes -Value Invoke-KubectlEditService
Export-ModuleMember -Function Invoke-KubectlEditService -Alias kes

function Invoke-KubectlDescribeService {
    kubectl describe svc @args
}
Set-Alias -Name kds -Value Invoke-KubectlDescribeService
Export-ModuleMember -Function Invoke-KubectlDescribeService -Alias kds

function Invoke-KubectlDeleteService {
    kubectl delete svc @args
}
Set-Alias -Name kdels -Value Invoke-KubectlDeleteService
Export-ModuleMember -Function Invoke-KubectlDeleteService -Alias kdels

# Ingress management
function Invoke-KubectlGetIngress {
    kubectl get ingress @args
}
Set-Alias -Name kgi -Value Invoke-KubectlGetIngress
Export-ModuleMember -Function Invoke-KubectlGetIngress -Alias kgi

function Invoke-KubectlGetIngressAllNamespaces {
    kubectl get ingress --all-namespaces @args
}
Set-Alias -Name kgia -Value Invoke-KubectlGetIngressAllNamespaces
Export-ModuleMember -Function Invoke-KubectlGetIngressAllNamespaces -Alias kgia

function Invoke-KubectlEditIngress {
    kubectl edit ingress @args
}
Set-Alias -Name kei -Value Invoke-KubectlEditIngress
Export-ModuleMember -Function Invoke-KubectlEditIngress -Alias kei

function Invoke-KubectlDescribeIngress {
    kubectl describe ingress @args
}
Set-Alias -Name kdi -Value Invoke-KubectlDescribeIngress
Export-ModuleMember -Function Invoke-KubectlDescribeIngress -Alias kdi

function Invoke-KubectlDeleteIngress {
    kubectl delete ingress @args
}
Set-Alias -Name kdeli -Value Invoke-KubectlDeleteIngress
Export-ModuleMember -Function Invoke-KubectlDeleteIngress -Alias kdeli

# Namespace management
function Invoke-KubectlGetNamespaces {
    kubectl get namespaces @args
}
Set-Alias -Name kgns -Value Invoke-KubectlGetNamespaces
Export-ModuleMember -Function Invoke-KubectlGetNamespaces -Alias kgns

function Invoke-KubectlEditNamespace {
    kubectl edit namespace @args
}
Set-Alias -Name kens -Value Invoke-KubectlEditNamespace
Export-ModuleMember -Function Invoke-KubectlEditNamespace -Alias kens

function Invoke-KubectlDescribeNamespace {
    kubectl describe namespace @args
}
Set-Alias -Name kdns -Value Invoke-KubectlDescribeNamespace
Export-ModuleMember -Function Invoke-KubectlDescribeNamespace -Alias kdns

function Invoke-KubectlDeleteNamespace {
    kubectl delete namespace @args
}
Set-Alias -Name kdelns -Value Invoke-KubectlDeleteNamespace
Export-ModuleMember -Function Invoke-KubectlDeleteNamespace -Alias kdelns

function Invoke-KubectlConfigSetContextCurrentNamespace {
    kubectl config set-context --current --namespace @args
}
Set-Alias -Name kcn -Value Invoke-KubectlConfigSetContextCurrentNamespace
Export-ModuleMember -Function Invoke-KubectlConfigSetContextCurrentNamespace -Alias kcn

# ConfigMap management
function Invoke-KubectlGetConfigMaps {
    kubectl get configmaps @args
}
Set-Alias -Name kgcm -Value Invoke-KubectlGetConfigMaps
Export-ModuleMember -Function Invoke-KubectlGetConfigMaps -Alias kgcm

function Invoke-KubectlGetConfigMapsAllNamespaces {
    kubectl get configmaps --all-namespaces @args
}
Set-Alias -Name kgcma -Value Invoke-KubectlGetConfigMapsAllNamespaces
Export-ModuleMember -Function Invoke-KubectlGetConfigMapsAllNamespaces -Alias kgcma

function Invoke-KubectlEditConfigMap {
    kubectl edit configmap @args
}
Set-Alias -Name kecm -Value Invoke-KubectlEditConfigMap
Export-ModuleMember -Function Invoke-KubectlEditConfigMap -Alias kecm

function Invoke-KubectlDescribeConfigMap {
    kubectl describe configmap @args
}
Set-Alias -Name kdcm -Value Invoke-KubectlDescribeConfigMap
Export-ModuleMember -Function Invoke-KubectlDescribeConfigMap -Alias kdcm

function Invoke-KubectlDeleteConfigMap {
    kubectl delete configmap @args
}
Set-Alias -Name kdelcm -Value Invoke-KubectlDeleteConfigMap
Export-ModuleMember -Function Invoke-KubectlDeleteConfigMap -Alias kdelcm

# Secret management
function Invoke-KubectlGetSecret {
    kubectl get secret @args
}
Set-Alias -Name kgsec -Value Invoke-KubectlGetSecret
Export-ModuleMember -Function Invoke-KubectlGetSecret -Alias kgsec

function Invoke-KubectlGetSecretAllNamespaces {
    kubectl get secret --all-namespaces @args
}
Set-Alias -Name kgseca -Value Invoke-KubectlGetSecretAllNamespaces
Export-ModuleMember -Function Invoke-KubectlGetSecretAllNamespaces -Alias kgseca

function Invoke-KubectlDescribeSecret {
    kubectl describe secret @args
}
Set-Alias -Name kdsec -Value Invoke-KubectlDescribeSecret
Export-ModuleMember -Function Invoke-KubectlDescribeSecret -Alias kdsec

function Invoke-KubectlDeleteSecret {
    kubectl delete secret @args
}
Set-Alias -Name kdelsec -Value Invoke-KubectlDeleteSecret
Export-ModuleMember -Function Invoke-KubectlDeleteSecret -Alias kdelsec

# Deployment management.
function Invoke-KubectlGetDeployment {
    kubectl get deployment @args
}
Set-Alias -Name kgd -Value Invoke-KubectlGetDeployment
Export-ModuleMember -Function Invoke-KubectlGetDeployment -Alias kgd

function Invoke-KubectlGetDeploymentAllNamespaces {
    kubectl get deployment --all-namespaces @args
}
Set-Alias -Name kgda -Value Invoke-KubectlGetDeploymentAllNamespaces
Export-ModuleMember -Function Invoke-KubectlGetDeploymentAllNamespaces -Alias kgda

function Invoke-KubectlGetDeploymentWatch {
    kubectl get deployment --watch @args
}
Set-Alias -Name kgdw -Value Invoke-KubectlGetDeploymentWatch
Export-ModuleMember -Function Invoke-KubectlGetDeploymentWatch -Alias kgdw

function Invoke-KubectlGetDeploymentWide {
    kubectl get deployment -o wide @args
}
Set-Alias -Name kgdwide -Value Invoke-KubectlGetDeploymentWide
Export-ModuleMember -Function Invoke-KubectlGetDeploymentWide -Alias kgdwide

function Invoke-KubectlEditDeployment {
    kubectl edit deployment @args
}
Set-Alias -Name ked -Value Invoke-KubectlEditDeployment
Export-ModuleMember -Function Invoke-KubectlEditDeployment -Alias ked

Set-Alias -Name kdd -Value Invoke-KubectlDescribeDeployment
Export-ModuleMember -Alias kdd

function Invoke-KubectlDeleteDeployment {
    kubectl delete deployment @args
}
Set-Alias -Name kdeld -Value Invoke-KubectlDeleteDeployment
Export-ModuleMember -Function Invoke-KubectlDeleteDeployment -Alias kdeld

function Invoke-KubectlScaleDeployment {
    kubectl scale deployment @args
}
Set-Alias -Name ksd -Value Invoke-KubectlScaleDeployment
Export-ModuleMember -Function Invoke-KubectlScaleDeployment -Alias ksd

function Invoke-KubectlRolloutStatusDeployment {
    kubectl rollout status deployment @args
}
Set-Alias -Name krsd -Value Invoke-KubectlRolloutStatusDeployment
Export-ModuleMember -Function Invoke-KubectlRolloutStatusDeployment -Alias krsd

function kres {
    [string] $timestamp = [DateTime]::UtcNow.ToString("yyyyMMddHHmmss")
    kubectl set env @args REFRESHED_AT=$timestamp
}
Export-ModuleMember -Alias kres

# Rollout management.
function Invoke-KubectlGetReplicaSet {
    kubectl get replicaset @args
}
Set-Alias -Name kgrs -Value Invoke-KubectlGetReplicaSet
Export-ModuleMember -Function Invoke-KubectlGetReplicaSet -Alias kgrs

function Invoke-KubectlDescribeReplicaSet {
    kubectl describe replicaset @args
}
Set-Alias -Name kdrs -Value Invoke-KubectlDescribeReplicaSet
Export-ModuleMember -Function Invoke-KubectlDescribeReplicaSet -Alias kdrs

function Invoke-KubectlEditReplicaSet {
    kubectl edit replicaset @args
}
Set-Alias -Name kers -Value Invoke-KubectlEditReplicaSet
Export-ModuleMember -Function Invoke-KubectlEditReplicaSet -Alias kers

function Invoke-KubectlRolloutHistory {
    kubectl rollout history @args
}
Set-Alias -Name krh -Value Invoke-KubectlRolloutHistory
Export-ModuleMember -Function Invoke-KubectlRolloutHistory -Alias krh

function Invoke-KubectlRolloutUndo {
    kubectl rollout undo @args
}
Set-Alias -Name kru -Value Invoke-KubectlRolloutUndo
Export-ModuleMember -Function Invoke-KubectlRolloutUndo -Alias kru

# Statefulset management.
function Invoke-KubectlGetStatefulSet {
    kubectl get statefulset @args
}
Set-Alias -Name kgss -Value Invoke-KubectlGetStatefulSet
Export-ModuleMember -Function Invoke-KubectlGetStatefulSet -Alias kgss

function Invoke-KubectlGetStatefulSetAllNamespaces {
    kubectl get statefulset --all-namespaces @args
}
Set-Alias -Name kgssa -Value Invoke-KubectlGetStatefulSetAllNamespaces
Export-ModuleMember -Function Invoke-KubectlGetStatefulSetAllNamespaces -Alias kgssa

function Invoke-KubectlGetStatefulSetWatch {
    kubectl get statefulset --watch @args
}
Set-Alias -Name kgssw -Value Invoke-KubectlGetStatefulSetWatch
Export-ModuleMember -Function Invoke-KubectlGetStatefulSetWatch -Alias kgssw

function Invoke-KubectlGetStatefulSetWide {
    kubectl get statefulset -o wide @args
}
Set-Alias -Name kgsswide -Value Invoke-KubectlGetStatefulSetWide
Export-ModuleMember -Function Invoke-KubectlGetStatefulSetWide -Alias kgsswide

function Invoke-KubectlEditStatefulSet {
    kubectl edit statefulset @args
}
Set-Alias -Name kess -Value Invoke-KubectlEditStatefulSet
Export-ModuleMember -Function Invoke-KubectlEditStatefulSet -Alias kess

function Invoke-KubectlDescribeStatefulSet {
    kubectl describe statefulset @args
}
Set-Alias -Name kdss -Value Invoke-KubectlDescribeStatefulSet
Export-ModuleMember -Function Invoke-KubectlDescribeStatefulSet -Alias kdss

function Invoke-KubectlDeleteStatefulSet {
    kubectl delete statefulset @args
}
Set-Alias -Name kdelss -Value Invoke-KubectlDeleteStatefulSet
Export-ModuleMember -Function Invoke-KubectlDeleteStatefulSet -Alias kdelss

function Invoke-KubectlScaleStatefulSet {
    kubectl scale statefulset @args
}
Set-Alias -Name ksss -Value Invoke-KubectlScaleStatefulSet
Export-ModuleMember -Function Invoke-KubectlScaleStatefulSet -Alias ksss

function Invoke-KubectlRolloutStatusStatefulSet {
    kubectl rollout status statefulset @args
}
Set-Alias -Name krsss -Value Invoke-KubectlRolloutStatusStatefulSet
Export-ModuleMember -Function Invoke-KubectlRolloutStatusStatefulSet -Alias krsss

# Port forwarding
function Invoke-KubectlPortForward {
    kubectl port-forward @args
}
Set-Alias -Name kpf -Value Invoke-KubectlPortForward
Export-ModuleMember -Function Invoke-KubectlPortForward -Alias kpf

# Tools for accessing all information
function Invoke-KubectlGetAll {
    kubectl get all @args
}
Set-Alias -Name kga -Value Invoke-KubectlGetAll
Export-ModuleMember -Function Invoke-KubectlGetAll -Alias kga

function Invoke-KubectlGetAllAllNamespaces {
    kubectl get all --all-namespaces @args
}
Set-Alias -Name kgaa -Value Invoke-KubectlGetAllAllNamespaces
Export-ModuleMember -Function Invoke-KubectlGetAllAllNamespaces -Alias kgaa

# Logs
function Invoke-KubectlLogs {
    kubectl logs @args
}
Set-Alias -Name kl -Value Invoke-KubectlLogs
Export-ModuleMember -Function Invoke-KubectlLogs -Alias kl

function Invoke-KubectlLogsSince1h {
    kubectl logs --since 1h @args
}
Set-Alias -Name kl1h -Value Invoke-KubectlLogsSince1h
Export-ModuleMember -Function Invoke-KubectlLogsSince1h -Alias kl1h

function Invoke-KubectlLogsSince1m {
    kubectl logs --since 1m @args
}
Set-Alias -Name kl1m -Value Invoke-KubectlLogsSince1m
Export-ModuleMember -Function Invoke-KubectlLogsSince1m -Alias kl1m

function Invoke-KubectlLogsSince1s {
    kubectl logs --since 1s @args
}
Set-Alias -Name kl1s -Value Invoke-KubectlLogsSince1s
Export-ModuleMember -Function Invoke-KubectlLogsSince1s -Alias kl1s

function Invoke-KubectlLogsFollow {
    kubectl logs -f @args
}
Set-Alias -Name klf -Value Invoke-KubectlLogsFollow
Export-ModuleMember -Function Invoke-KubectlLogsFollow -Alias klf

function Invoke-KubectlLogsSince1hFollow {
    kubectl logs --since 1h -f @args
}
Set-Alias -Name klf1h -Value Invoke-KubectlLogsSince1hFollow
Export-ModuleMember -Function Invoke-KubectlLogsSince1hFollow -Alias klf1h

function Invoke-KubectlLogsSince1mFollow {
    kubectl logs --since 1m -f @args
}
Set-Alias -Name klf1m -Value Invoke-KubectlLogsSince1mFollow
Export-ModuleMember -Function Invoke-KubectlLogsSince1mFollow -Alias klf1m

function Invoke-KubectlLogsSince1sFollow {
    kubectl logs --since 1s -f @args
}
Set-Alias -Name klf1s -Value Invoke-KubectlLogsSince1sFollow
Export-ModuleMember -Function Invoke-KubectlLogsSince1sFollow -Alias klf1s

# File copy
function Invoke-KubectlCopy {
    kubectl cp @args
}
Set-Alias -Name kcp -Value Invoke-KubectlCopy
Export-ModuleMember -Function Invoke-KubectlCopy -Alias kcp

# Node Management
Set-Alias -Name kgno -Value Invoke-KubectlGetNodes
Export-ModuleMember -Alias kgno

function Invoke-KubectlEditNode {
    kubectl edit node @args
}
Set-Alias -Name keno -Value Invoke-KubectlEditNode
Export-ModuleMember -Function Invoke-KubectlEditNode -Alias keno

Set-Alias -Name kdno -Value Invoke-KubectlDescribeNode
Export-ModuleMember -Alias kdno

function Invoke-KubectlDeleteNode {
    kubectl delete node @args
}
Set-Alias -Name kdelno -Value Invoke-KubectlDeleteNode
Export-ModuleMember -Function Invoke-KubectlDeleteNode -Alias kdelno

# PVC management.
function Invoke-KubectlGetPersistentVolumeClaim {
    kubectl get pvc @args
}
Set-Alias -Name kgpvc -Value Invoke-KubectlGetPersistentVolumeClaim
Export-ModuleMember -Function Invoke-KubectlGetPersistentVolumeClaim -Alias kgpvc

function Invoke-KubectlGetPersistentVolumeClaimAllNamespaces {
    kubectl get pvc --all-namespaces @args
}
Set-Alias -Name kgpvca -Value Invoke-KubectlGetPersistentVolumeClaimAllNamespaces
Export-ModuleMember -Function Invoke-KubectlGetPersistentVolumeClaimAllNamespaces -Alias kgpvca

function Invoke-KubectlGetPersistentVolumeClaimWatch {
    kubectl get pvc --watch @args
}
Set-Alias -Name kgpvcw -Value Invoke-KubectlGetPersistentVolumeClaimWatch
Export-ModuleMember -Function Invoke-KubectlGetPersistentVolumeClaimWatch -Alias kgpvcw

function Invoke-KubectlEditPersistentVolumeClaim {
    kubectl edit pvc @args
}
Set-Alias -Name kepvc -Value Invoke-KubectlEditPersistentVolumeClaim
Export-ModuleMember -Function Invoke-KubectlEditPersistentVolumeClaim -Alias kepvc

function Invoke-KubectlDescribePersistentVolumeClaim {
    kubectl describe pvc @args
}
Set-Alias -Name kdpvc -Value Invoke-KubectlDescribePersistentVolumeClaim
Export-ModuleMember -Function Invoke-KubectlDescribePersistentVolumeClaim -Alias kdpvc

function Invoke-KubectlDeletePersistentVolumeClaim {
    kubectl delete pvc @args
}
Set-Alias -Name kdelpvc -Value Invoke-KubectlDeletePersistentVolumeClaim

# Service account management.
function Invoke-KubectlDescribeServiceAccount {
    kubectl describe sa @args
}
Set-Alias -Name kdsa -Value Invoke-KubectlDescribeServiceAccount
Export-ModuleMember -Function Invoke-KubectlDescribeServiceAccount -Alias kdsa

function Invoke-KubectlDeleteServiceAccount {
    kubectl delete sa @args
}
Set-Alias -Name kdelsa -Value Invoke-KubectlDeleteServiceAccount
Export-ModuleMember -Function Invoke-KubectlDeleteServiceAccount -Alias kdelsa

# DaemonSet management.
function Invoke-KubectlGetDaemonSet {
    kubectl get daemonset @args
}
Set-Alias -Name kgds -Value Invoke-KubectlGetDaemonSet
Export-ModuleMember -Function Invoke-KubectlGetDaemonSet -Alias kgds

function Invoke-KubectlGetDaemonSetWatch {
    kubectl get daemonset --watch @args
}
Set-Alias -Name kgdsw -Value Invoke-KubectlGetDaemonSetWatch
Export-ModuleMember -Function Invoke-KubectlGetDaemonSetWatch -Alias kgdsw

function Invoke-KubectlEditDaemonSet {
    kubectl edit daemonset @args
}
Set-Alias -Name keds -Value Invoke-KubectlEditDaemonSet
Export-ModuleMember -Function Invoke-KubectlEditDaemonSet -Alias keds

function Invoke-KubectlDescribeDaemonSet {
    kubectl describe daemonset @args
}
Set-Alias -Name kdds -Value Invoke-KubectlDescribeDaemonSet
Export-ModuleMember -Function Invoke-KubectlDescribeDaemonSet -Alias kdds

function Invoke-KubectlDeleteDaemonSet {
    kubectl delete daemonset @args
}
Set-Alias -Name kdelds -Value Invoke-KubectlDeleteDaemonSet
Export-ModuleMember -Function Invoke-KubectlDeleteDaemonSet -Alias kdelds

# CronJob management.
function Invoke-KubectlGetCronJob {
    kubectl get cronjob @args
}
Set-Alias -Name kgcj -Value Invoke-KubectlGetCronJob
Export-ModuleMember -Function Invoke-KubectlGetCronJob -Alias kgcj

function Invoke-KubectlEditCronJob {
    kubectl edit cronjob @args
}
Set-Alias -Name kecj -Value 'kubectl edit cronjob'
Export-ModuleMember -Function Invoke-KubectlEditCronJob -Alias kecj

function Invoke-KubectlDescribeCronJob {
    kubectl describe cronjob @args
}
Set-Alias -Name kdcj -Value Invoke-KubectlDescribeCronJob
Export-ModuleMember -Function Invoke-KubectlDescribeCronJob -Alias kdcj

function Invoke-KubectlDeleteCronJob {
    kubectl delete cronjob @args
}
Set-Alias -Name kdelcj -Value Invoke-KubectlDeleteCronJob
Export-ModuleMember -Function Invoke-KubectlDeleteCronJob -Alias kdelcj

# Job management.
function Invoke-KubectlGetJob {
    kubectl get job @args
}
Set-Alias -Name kgj -Value Invoke-KubectlGetJob
Export-ModuleMember -Function Invoke-KubectlGetJob -Alias kgj

function Invoke-KubectlEditJob {
    kubectl edit job @args
}
Set-Alias -Name kej -Value Invoke-KubectlEditJob
Export-ModuleMember -Function Invoke-KubectlEditJob -Alias kej

function Invoke-KubectlDescribeJob {
    kubectl describe job @args
}
Set-Alias -Name kdj -Value Invoke-KubectlDescribeJob
Export-ModuleMember -Function Invoke-KubectlDescribeJob -Alias kdj

function Invoke-KubectlDeleteJob {
    kubectl delete job @args
}
Set-Alias -Name kdelj -Value Invoke-KubectlDeleteJob
Export-ModuleMember -Function Invoke-KubectlDeleteJob -Alias kdelj
