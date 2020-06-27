import React from 'react'
import ReactDOM from 'react-dom'

class Job extends React.Component {
  render() {
    return <p>Job</p>
  }
}

document.addEventListener('turbolinks:load', () => {
  const app = document.getElementById('todo-app')
  app && ReactDOM.render(<Job />, app)
})