const { Task } = require("../../tasks/tasks")

describe('Prueba Cron Ticker', () => {
  test('Se debe ejecutar dos veces', () => {
    Task()
    const time = Task()
    console.log(time);
    
    expect(time).toBe(2)
  })
})