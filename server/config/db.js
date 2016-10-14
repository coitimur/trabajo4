
exports.connect_options = {
            host: process.env.HOST || 'localhost', // server name or IP address;
            port: process.env.PORT || 5432,
            database: process.env.DATABASE || 'postgres',
            user: process.env.USER_DB || 'postgres',
            password: process.env.PASSWORD || '1234'
        };

