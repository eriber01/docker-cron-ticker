// const express = require('express')

// const app = express()
// const port = 5000
const { schedule } = require('node-cron')
const { Task } = require('./tasks/tasks')

schedule('*/5 * * * * *', Task)

// app.get('/', async (req, res) => {
//   let time = 0

//   schedule('*/5 * * * * *', () => {
//     time = Task()
//     console.log(time);
//     res.status(200).json({
//       message: time
//     })
//   })


// })

// app.listen(port, () => {
//   console.log('app en el puerto: ', port);
// })

console.log('Inicio');