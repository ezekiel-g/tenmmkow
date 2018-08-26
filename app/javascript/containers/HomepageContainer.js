import React, { Component } from 'react'
import { Link } from 'react-router'

class HomepageContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {

    }
  }

  render() {

    return(
      <div>
        <h2>10MM KINGS OF WAR</h2>
        <Link to='/groups'>ALL GROUPS</Link>
      </div>
    )
  }
}

export default HomepageContainer
