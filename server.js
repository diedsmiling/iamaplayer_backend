import dotenv from 'dotenv'
import fs from 'fs';
import express from 'express';
import Schema from './schema/schema';
import GraphQLHTTP from 'express-graphql';
import {graphql} from 'graphql';
import {introspectionQuery} from 'graphql/utilities';
import {MongoClient} from 'mongodb'

dotenv.config()

let app = express();

(async () => {
  try {
    let db = await MongoClient.connect(
      process.env.MONGO_URL,
      { uri_decode_auth: true }
    )
    let schema = Schema(db)

    app.use('/graphql', GraphQLHTTP({
      schema,
      graphiql: process.env.GRAPHIQL
    }));

    let server = app.listen(process.env.PORT || 3000, () => {
      console.log(`Listening on port ${server.address().port}`)
    });

  } catch(e) {
    console.warn(e)
  }
})();