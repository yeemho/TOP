var convert = require('./tempConversion');

describe('ftoc', function() {
  it('works', function() {
    expect(convert.ftoc(32)).toEqual(0);
  });
  it('rounds to 1 decimal', function() {
    expect(convert.ftoc(100)).toEqual(37.8);
  });
  it('works with negatives', function() {
    expect(convert.ftoc(-100)).toEqual(-73.3);
  });
});

describe('ctof', function() {
  it('works', function() {
    expect(convert.ctof(0)).toEqual(32);
  });
  it('rounds to 1 decimal', function() {
    expect(convert.ctof(73.2)).toEqual(163.8);
  });
  it('works with negatives', function() {
    expect(convert.ctof(-10)).toEqual(14);
  });
});
