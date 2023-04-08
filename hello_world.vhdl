entity hello_world is
end entity;

architecture behavior of hello_world is
begin
    process is
    begin
        report "Hello, world!";
        wait;
    end process;
end behavior;
