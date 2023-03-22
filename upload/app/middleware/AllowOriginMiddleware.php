<?php


namespace app\middleware;


use app\Request;
use think\facade\Config;
use think\Response;

/**
 * 跨域中间件
 * Class AllowOriginMiddleware
 * @package app\http\middleware
 */
class AllowOriginMiddleware
{
    /**
     * header头
     * @var array
     */
    // protected $header = [
    //     'Access-Control-Allow-Origin'   => '*',
    //     'Access-Control-Allow-Headers'  => 'Authori-zation,Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-Requested-With',
    //     'Access-Control-Allow-Methods'  => 'GET,POST,PATCH,PUT,DELETE,OPTIONS,DELETE',
    //     'Access-Control-Max-Age'        =>  '1728000'
    // ];
    protected $header = [
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Allow-Methods' => 'OPTIONS,POST,GET,DELETE,PUT',
        'Access-Control-Allow-Credentials' => 'true',
        'Access-Control-Allow-Headers' => 'x-token,x-uid,x-token-check,x-requested-with,content-type,Host,token',
    ];

    /**
     * 允许跨域的域名
     * @var string
     */
    protected $cookieDomain;

    /**
     * @param Request $request
     * @param \Closure $next
     * @return Response
     */
    public function handle(Request $request, \Closure $next)
    {
        $header = $this->header;
        if ($request->method(true) == 'OPTIONS') {
            $response = Response::create('ok')->code(200)->header($header);
        } else {
            $response = $next($request)->header($header);
        }

        return $response;
    }
}