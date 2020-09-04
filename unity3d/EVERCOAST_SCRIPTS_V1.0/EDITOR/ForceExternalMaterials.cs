//  Copyright (C) 2020 Evercoast Inc. All Rights Reserved.

#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;

public class ForceExternalMaterialProcessor : AssetPostprocessor
{
    void OnPreprocessModel()
    {
        if (!assetPath.Contains("EVERCOAST VOLUMETRIC"))
            return;
        var importSettingsMissing = assetImporter.importSettingsMissing;
        if (!importSettingsMissing)
            return;
        var modelImporter = assetImporter as ModelImporter;
        modelImporter.materialLocation = ModelImporterMaterialLocation.External;
    }
}

#endif
