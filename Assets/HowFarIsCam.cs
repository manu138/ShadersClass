using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HowFarIsCam : MonoBehaviour {
    private Vector3 whereIam;
    private Vector3 whereIsCam;
    private Renderer render;
    public GameObject camera;
    public Vector3 total;
    public float totalNormalize;
    public float maxStrenght;
    // Use this for initialization
    void Start() {
        render = GetComponent <Renderer>();
	}

    // Update is called once per frame
    void Update()
    {
        whereIam = transform.position;
        whereIsCam = camera.transform.position;
        total = whereIsCam - whereIam;
        totalNormalize = total.magnitude;
  
        totalNormalize= 0.475f * totalNormalize -2.31f;
        render.material.SetFloat("_Fuerza", totalNormalize);

	}
}
