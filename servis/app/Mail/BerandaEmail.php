<?php

namespace App\Mail;

use GuzzleHttp\Psr7\Request;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class BerandaEmail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public $nama;
    public $website;
    public $token;

    public function __construct($nama,$website,$token)
    {
        $this->nama = $nama;
        $this->website = $website;
        $this->token = $token;
        //
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
       return $this->from('berandainformatika@gmail.com')
                   ->view('mail.mail')
                   ->with(
                    [
                        'nama' =>$this->nama,
                        'website' => $this->website,
                        'token' => $this->token

                    ]);
        
    }

   
}
