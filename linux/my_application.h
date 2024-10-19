#ifndef FLUTTER_MY_APPLICATION_H_
#define FLUTTER_MY_APPLICATION_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(MyApplication, my_application, MY, APPLICATION, GtkApplication)

/**
 * MyApplication:
 *
 * This is a custom GTK application that integrates Flutter within a
 * GTK-based window. It provides a way to run Flutter-based content 
 * inside a native Linux GTK application.
 */

/**
 * my_application_new:
 * 
 * Creates a new instance of #MyApplication, which is a GTK application
 * designed to run Flutter-based content. This function sets up the 
 * application with the required initialization parameters and ensures
 * proper integration with the Flutter rendering engine.
 *
 * Returns: (transfer full): A newly created instance of #MyApplication.
 */
MyApplication* my_application_new();

#endif  // FLUTTER_MY_APPLICATION_H_
