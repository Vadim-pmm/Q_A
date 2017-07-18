class Email extends React.Component {
    constructor() {
        super();
        this.state = {
            is_hidden: {display: 'none'}
        };
        this.sendQA = this.sendQA.bind(this);
        this.showSendForm = this.showSendForm.bind(this);
    }

    sendQA(e) {
        e.preventDefault();
        this.setState({is_hidden: {display: 'none'}});
        address = $('[name="email"]').val();

        // $.ajax(`/send_mail/${address}`);
        $.ajax({
            url: '/send_message',
            type: "POST",
            dataType: "html",
            data: { address: address }, // This goes to Controller in params hash, i.e. params[:id]
        })
    }

    showSendForm(e) {
        e.preventDefault();
        this.setState({is_hidden: {display: 'block'}});
    }

    render() {
        return (<div className="ui right labeled input">
                   <button className="ui button" onClick={this.showSendForm}>
                       <i className='mail outline icon' />
                   </button>

                    <form style={this.state.is_hidden} onSubmit={this.sendQA}>
                        <input type="email" name='email' required />
                        <button type="submit" className="ui button">
                            <i className='send icon' />
                        </button>
                    </form>
                </div>);
    }
}
