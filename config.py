import os

class Config:
    ENV = os.getenv('ENV', 'local')  # 'local' o 'cloud'
    DATABASE_URI = os.getenv('DATABASE_URI', 'sqlite:///local.db')
    DEBUG = ENV == 'local'

config = Config()

