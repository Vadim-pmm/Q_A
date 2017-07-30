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
        return (
            /*<div onClick={this.handleClick}><span id='saveButton'>Save</span></div>*/
            <button className='ui primary basic button' onClick={this.handleClick} id='saveButton'>
                <i className='save icon'></i>
                <span><strong>Save</strong></span>
            </button>
        );
    }
}
