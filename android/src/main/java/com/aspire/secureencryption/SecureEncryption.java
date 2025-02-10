package com.aspire.secureencryption;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import android.util.Base64;

public class SecureEncryption {
    private static final String SECRET_KEY = "6w9z$C&F)J@NcRfU";
    private static final String AES_MODE = "AES/GCM/NoPadding";

    private static SecretKey getSecretKey() {
        return new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
    }

    public static String encrypt(String plaintext) throws Exception {
        Cipher cipher = Cipher.getInstance(AES_MODE);
        cipher.init(Cipher.ENCRYPT_MODE, getSecretKey());
        byte[] iv = cipher.getIV();
        byte[] encryptedData = cipher.doFinal(plaintext.getBytes());

        return Base64.encodeToString(iv, Base64.NO_WRAP) + ":" + Base64.encodeToString(encryptedData, Base64.NO_WRAP);
    }

    public static String decrypt(String encrypted) throws Exception {
        String[] parts = encrypted.split(":");
        byte[] iv = Base64.decode(parts[0], Base64.NO_WRAP);
        byte[] encryptedData = Base64.decode(parts[1], Base64.NO_WRAP);

        Cipher cipher = Cipher.getInstance(AES_MODE);
        cipher.init(Cipher.DECRYPT_MODE, getSecretKey(), new GCMParameterSpec(128, iv));
        byte[] decryptedData = cipher.doFinal(encryptedData);

        return new String(decryptedData);
    }
}
