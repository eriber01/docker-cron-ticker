const { schedule } = require('node-cron')
const { Task } = require('./tasks/tasks')

console.log('Inicio');
schedule('*/5 * * * * *', Task)