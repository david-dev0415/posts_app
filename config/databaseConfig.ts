import { DatabaseSetting } from '../types/environment'

export class DatabaseConfig {

  public settings: DatabaseSetting

  constructor() {
    this.settings = {
      host: process.env.DB_HOST || 'localhost',
      port: Number(process.env.DB_PORT) || 5432,
      username: process.env.DB_USER || 'postgres',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'db_posts',
    }
  }
}