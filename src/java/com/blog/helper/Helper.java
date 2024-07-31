
package com.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author rishan
 */
public class Helper {

    public static boolean deleteFile(String path) {
        boolean f = false;

        try {

            File file = new File(path);
            f = file.delete();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public static boolean saveFile(InputStream inputStream, String path) {
        boolean f = false;

        try {
            byte[] b = new byte[inputStream.available()];

            inputStream.read(b);

            try (FileOutputStream outputStream = new FileOutputStream(path)) {
                outputStream.write(b);
                
                outputStream.flush();
            }

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
