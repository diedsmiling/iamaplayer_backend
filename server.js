import dotenv from 'dotenv'
import Koa from 'koa'
import graphQLHTTP from 'koa-graphql'
import mount from 'koa-mount'
import convert from 'koa-convert'
import { schema } from './data/schema'

dotenv.config()

const graphQLServer = new Koa()

graphQLServer.use(mount('/', convert(graphQLHTTP({ schema, pretty: true }))))

graphQLServer.listen(process.env.PORT, () => console.log(
  `GraphQL Server is now running on http://localhost:${process.env.PORT}`
))
