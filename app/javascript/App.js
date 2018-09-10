import React, { Component } from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import UserShowContainer from 'containers/UserShowContainer'
import GroupsIndexContainer from 'containers/GroupsIndexContainer'
import GroupShowContainer from 'containers/GroupShowContainer'

class App extends Component {
  constructor(props){
    super(props)
    this.state = {

    }
  }

  render() {
    $(function(){
      var flashDurationInSeconds = 5;
      var flashContainerId = 'flash-messages';

      function removeFlashMessages() {
        $('#' + flashContainerId).remove();
      }

      setTimeout(removeFlashMessages, flashDurationInSeconds * 1000);
    })

    return(
      <Router history={browserHistory}>
        <Route path='/'>
          <IndexRoute component={GroupsIndexContainer} />
          <Route path='/groups' component={GroupsIndexContainer} />
          <Route path='/groups/:id' component={GroupShowContainer} />
        </Route>
      </Router>
    )
  }
}

export default App;
