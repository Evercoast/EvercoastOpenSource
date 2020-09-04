//  Copyright (C) 2020 Evercoast Inc. All Rights Reserved.

#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;
using System.Text.RegularExpressions;

class ImportAssets : AssetPostprocessor
{
    void OnPreprocessTexture()
    {
        if (!assetPath.Contains("EVERCOAST VOLUMETRIC"))
            return;
        TextureImporter textureImporter = (TextureImporter)assetImporter;
        textureImporter.mipmapEnabled = false;
        textureImporter.npotScale = TextureImporterNPOTScale.None;
        textureImporter.filterMode = FilterMode.Point;
        textureImporter.alphaSource = TextureImporterAlphaSource.None;
        textureImporter.maxTextureSize = 4096;
    }
}

#endif
