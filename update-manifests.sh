#!/bin/sh -x

SRCROOT="$( CDPATH='' cd -- "$(dirname "$0")" && pwd -P )"
AUTOGENMSG="# This is an auto-generated file. DO NOT EDIT"

echo "${AUTOGENMSG}" > "${SRCROOT}/install_htpc.yaml"
kustomize build "${SRCROOT}/overlays/htpc" >> "${SRCROOT}/install_htpc.yaml"

echo "${AUTOGENMSG}" > "${SRCROOT}/install_smarthome.yaml"
kustomize build "${SRCROOT}/overlays/smarthome" >> "${SRCROOT}/install_smarthome.yaml"

echo "${AUTOGENMSG}" > "${SRCROOT}/install_matrix.yaml"
kustomize build "${SRCROOT}/overlays/matrix" >> "${SRCROOT}/install_matrix.yaml"

echo "${AUTOGENMSG}" > "${SRCROOT}/install_adblocker.yaml"
kustomize build "${SRCROOT}/overlays/adblocker" >> "${SRCROOT}/install_adblocker.yaml"

echo "${AUTOGENMSG}" > "${SRCROOT}/install_argocd.yaml"
kustomize build "${SRCROOT}/argocd" >> "${SRCROOT}/install_argocd.yaml"