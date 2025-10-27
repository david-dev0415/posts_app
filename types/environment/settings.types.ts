export interface DatabaseSetting {
  host: string;
  port: number;
  username: string;
  password: string;
  database: string;
  ssl?: boolean;
  maxConnections?: number;
  timeout?: number;
}

export interface EnvironmentSettings {
  nodeEnv: 'development' | 'production' | 'test';
  database: DatabaseConfig;  
}