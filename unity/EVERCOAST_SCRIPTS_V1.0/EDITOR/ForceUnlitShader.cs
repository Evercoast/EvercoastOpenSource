//  Copyright (C) 2020 Evercoast Inc. All Rights Reserved.

#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;

public class ForceUnlitShader : AssetPostprocessor
{
    void OnPostprocessMaterial(Material material)
    {
        if (!assetPath.Contains("EVERCOAST VOLUMETRIC"))
            return;
        material.shader = Shader.Find("Unlit/Texture");
    }
}

#endif
