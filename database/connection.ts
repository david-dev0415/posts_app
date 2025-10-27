import pg from 'pg'
import { DatabaseConfig } from '../config/databaseConfig'

export class DatabaseConnection {
  private static instance: pg.Pool

  private constructor() {}

  private static getConfig(): pg.PoolConfig {
    const dbConfig = new DatabaseConfig()

    return {
      host: dbConfig.settings.host,
      port: dbConfig.settings.port,
      user: dbConfig.settings.username,
      password: dbConfig.settings.password,
      database: dbConfig.settings.database,      
    }  
  }

  public static getInstance(): pg.Pool {
    if (!DatabaseConnection.instance) {
      const config = DatabaseConnection.getConfig()
      DatabaseConnection.instance = new pg.Pool(config)
      console.log('✅ PostgreSQL connection pool initialized.')
    }
    return DatabaseConnection.instance
  } 

}