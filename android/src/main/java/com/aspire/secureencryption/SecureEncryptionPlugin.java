package com.aspire.secureencryption;

import com.getcapacitor.Plugin;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.PluginCall;
import com.getcapacitor.JSObject;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "SecureEncryption")
public class SecureEncryptionPlugin extends Plugin {

    @PluginMethod
    public void encrypt(PluginCall call) {
        try {
            String plaintext = call.getString("plaintext");
            if (plaintext == null) {
                call.reject("Plaintext is required");
                return;
            }

            String ciphertext = SecureEncryption.encrypt(plaintext);
            JSObject result = new JSObject();
            result.put("ciphertext", ciphertext);
            call.resolve(result);
        } catch (Exception e) {
            call.reject("Encryption failed", e);
        }
    }

    @PluginMethod
    public void decrypt(PluginCall call) {  
        try {
            String ciphertext = call.getString("ciphertext");
            if (ciphertext == null) {
                call.reject("Ciphertext is required");
                return;
            }

            String plaintext = SecureEncryption.decrypt(ciphertext);
            JSObject result = new JSObject();
            result.put("plaintext", plaintext);
            call.resolve(result);
        } catch (Exception e) {
            call.reject("Decryption failed", e);
        }
    }
}
