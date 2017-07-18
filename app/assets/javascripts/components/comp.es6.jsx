class Comp extends React.Component {
    constructor() {
        super();
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        e.preventDefault();
        $.ajax('/export')
    }

    render() {
        return (<div onClick={this.handleClick}><span id='saveButton'>Save</span></div>);
    }
}

