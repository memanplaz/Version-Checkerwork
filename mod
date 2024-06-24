using BepInEx;
using UnityEngine;

[BepInPlugin("com.example.gorillatagmod", "Gorilla Tag Mod Menu", "1.0.0")]
public class GorillaTagModMenu : BaseUnityPlugin
{
    private bool menuVisible = false;
    private Rect windowRect = new Rect(20, 20, 250, 250); // Adjusted height to fit more buttons
    private Color backgroundColor = Color.red;

    void Update()
    {
        // Toggle menu visibility with X button on the left controller
        if (Input.GetKeyDown(KeyCode.Joystick1Button2)) // Example button
        {
            menuVisible = !menuVisible;
        }
    }

    void OnGUI()
    {
        if (menuVisible)
        {
            GUI.backgroundColor = backgroundColor;
            windowRect = GUI.Window(0, windowRect, DrawMenu, "Meman OP DLL");
        }
    }

    void DrawMenu(int windowID)
    {
        GUI.Label(new Rect(10, 20, 230, 20), "This is the mod menu!");
        
        GUIStyle buttonStyle = new GUIStyle(GUI.skin.button);
        buttonStyle.normal.textColor = Color.white;
        buttonStyle.normal.background = MakeTex(2, 2, Color.black);

        // Placeholder buttons
        if (GUI.Button(new Rect(10, 50, 230, 30), "Place holder", buttonStyle))
        {
            // Add your button action here
        }
        if (GUI.Button(new Rect(10, 90, 230, 30), "Place holder", buttonStyle))
        {
            // Add your button action here
        }
        if (GUI.Button(new Rect(10, 130, 230, 30), "Place holder", buttonStyle))
        {
            // Add your button action here
        }
        if (GUI.Button(new Rect(10, 170, 230, 30), "Place holder", buttonStyle))
        {
            // Add your button action here
        }

        // Close button
        if (GUI.Button(new Rect(10, 210, 230, 30), "Close", buttonStyle))
        {
            menuVisible = false;
        }

        // Allow the window to be dragged
        GUI.DragWindow(new Rect(0, 0, 10000, 20));
    }

    private Texture2D MakeTex(int width, int height, Color col)
    {
        Color[] pix = new Color[width * height];
        for (int i = 0; i < pix.Length; i++)
        {
            pix[i] = col;
        }
        Texture2D result = new Texture2D(width, height);
        result.SetPixels(pix);
        result.Apply();
        return result;
    }
}
