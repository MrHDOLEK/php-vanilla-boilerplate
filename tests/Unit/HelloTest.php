<?php

declare(strict_types=1);

namespace Vanilla\Tests;

use PHPUnit\Framework\TestCase;
use Vanilla\Hello;

class HelloTest extends TestCase
{
    public function testSayReturnsHelloWorldSuccess(): void
    {
        $hello = new Hello();

        $result = $hello->say();

        $this->assertSame("Hello World!", $result);
    }

    public function testSayReturnsStringSuccess(): void
    {
        $hello = new Hello();

        $result = $hello->say();

        $this->assertIsString($result);
    }

    public function testSayIsNotEmptySuccess(): void
    {
        $hello = new Hello();

        $result = $hello->say();

        $this->assertNotEmpty($result);
    }
}
