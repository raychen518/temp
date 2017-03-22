% This demo checks each pressed key and displays its number and name.
function KeyboardDemo_CheckKeys

% Use the common key naming scheme for all operating systems to increase
% the script's portability.
KbName('UnifyKeyNames');

% Display the prompt on the screen.
fprintf('Press a key to see its number and name.\n');
fprintf('Press the Escape key to exit.\n');

while true
    % Check the keyboard.
    [keyIsDown, ~, keyCodeResult] = KbCheck();

    % If a key is pressed...
    if keyIsDown
        % Find the pressed key.
        keyCode = find(keyCodeResult, 1);

        % Display the name and number of the pressed key.
        fprintf('The pressed key is %s (%i).\n', KbName(keyCode), keyCode);

        % Exit, if the Escape key is pressed.
        if keyCode == KbName('Escape')
            break;
        end

        % Wait until all keys are released, otherwise the "KbCheck"
        % function reports multiple same events when holding down a key.
        KbReleaseWait;
    end
end
