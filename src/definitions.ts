export interface SecureEncryptionPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
